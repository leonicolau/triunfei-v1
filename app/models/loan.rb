# frozen_string_literal: true

class Loan < ApplicationRecord
  include WizardFilterable
  acts_as_paranoid
  include Excel

  DEFAULT_VALUE_FOR_FILTER = 2000

  extend FriendlyId
  friendly_id :name, use: :slugged

  default_scope { order(order: :desc).where(active: true) }
  scope :with_inactive, -> { unscope(where: :active) }
  belongs_to :bank, -> { with_deleted }, touch: true

  has_many :product_redirects, as: :product

  validates :name, :bank_id, :interest_rate, presence: true
  # rubocop:disable Style/PercentLiteralDelimiters
  enum loan_type: %i[with_warranty without_warranty personal other]
  # rubocop:enable Style/PercentLiteralDelimiters
  default_scope { order(order: :desc) }

  after_create :create_meta_tag

  # Allow filter loans
  #
  # * *Args* :
  #   - +params+ -> Array<String> contains *path variable, splited by `/`
  # * *Returns* :
  #   - Loans filtered
  # * *Example* :
  #   - Passing param ['Itau'] will returns all loans belongs to Itau bank
  def self.filter(params)
    params = [] if params.nil?

    result = self

    banks = []

    params.each do |param|
      banks << Bank.find_by(slug: param)
    end

    result = result.where(bank_id: banks.compact.pluck(:id)) if banks.compact.present?

    result
  end

  # Calculate Quota based using PMT excel formula
  #
  # * *Args* :
  #   - +amount+ -> Number contains amount to loan
  #   - +time_value+ -> Number contains value for time selected
  #   - +time_type+ -> String contains month or year
  # * *Returns* :
  #   - Quota
  # * *Example* :
  #   - Passing param 2000, 12, month, will return the pmt for this parameters
  def quota(amount = nil, time_value = nil, time_type = nil)
    amount ||= DEFAULT_VALUE_FOR_FILTER
    time_value ||= 12
    time_type ||= 'month'

    time_value = time_value.to_i * 12 if time_type == 'year'
    (pmt((interest_rate / 100), time_value.to_i, amount.to_f) * -1).round(2)
  end

  def should_generate_new_friendly_id?
    true
  end

  def go_to_site_path
    Rails.application.routes.url_helpers.go_to_site_loan_path(self)
  end

  def create_meta_tag
    path = Rails.application.routes.url_helpers.loan_path(self)
    MetaTag.create!(name: 'description', value: I18n.t('loan.meta_tag', name: name), page: path)
  end
end

# frozen_string_literal: true

class Account < ApplicationRecord
  include WizardFilterable
  acts_as_paranoid

  extend FriendlyId
  friendly_id :name, use: :slugged

  ORDER_COLUMNS = { maispesquisadas: :order, customensal: :taxes, rendaminima: :minimum_rent }.freeze

  default_scope { order(order: :desc).where(active: true) }
  scope :with_inactive, -> { unscope(where: :active) }
  belongs_to :bank, -> { with_deleted }, touch: true

  has_many :product_redirects, as: :product

  validates :name, :bank_id, :link, presence: true

  after_create :create_meta_tag

  # Allow filter accounts
  #
  # * *Args* :
  #   - +params+ -> Array<String> contains *path variable, splited by `/`
  # * *Returns* :
  #   - Cards filtered
  # * *Example* :
  #   - Passing param ['Itau'] will returns all accounts belongs to Itau bank
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/PerceivedComplexity
  def self.filter(params)
    params = [] if params.nil?

    # select all order and apply last one
    order = params.select { |filter| filter.include?('ordenado-por') }
    params -= order
    order = order.try(:last)

    # select all custo-mensal filters and remove from params
    taxes = params.select { |filter| filter.include?('custo-mensal') }
    params -= taxes

    # select all renda-minima filters and remove from params
    rents = params.select { |filter| filter.include?('renda-minima') }
    params -= rents

    result = self

    if order
      result = result.unscope(:order)
      result = result.order(ORDER_COLUMNS[order.split('-')[2..10].join('').to_sym])
    end

    banks = []

    params.each do |param|
      banks << Bank.find_by(slug: param)
    end

    result = result.where(bank_id: banks.compact.pluck(:id)) if banks.compact.present?

    # filter by taxes
    taxes.each do |tax|
      tax = tax.split('-')
      result = if tax[2] == 'gratuito'
                 result.where('taxes IS NULL or taxes = 0')
               else
                 result.where('taxes >= ? AND taxes <= ?', tax[2], tax[3])
               end
    end

    # filter by rents
    rents.each do |rent|
      rent = rent.split('-')
      result = if rent[2] == 'naoexigida'
                 result.where('minimum_rent IS NULL or minimum_rent = 0')
               else
                 result.where('minimum_rent >= ? AND minimum_rent <= ?', rent[2], rent[3])
               end
    end

    result
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/PerceivedComplexity

  def should_generate_new_friendly_id?
    true
  end

  def go_to_site_path
    Rails.application.routes.url_helpers.go_to_site_account_path(self)
  end

  def create_meta_tag
    path = Rails.application.routes.url_helpers.account_path(self)
    MetaTag.create!(name: 'description', value: I18n.t('accounts.meta_tag', name: name), page: path)
  end
end

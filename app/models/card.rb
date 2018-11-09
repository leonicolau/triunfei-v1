# frozen_string_literal: true

class Card < ApplicationRecord
  include WizardFilterable
  acts_as_paranoid
  extend FriendlyId
  friendly_id :name, use: :slugged

  serialize :devices, Array
  # rubocop:disable Style/PercentLiteralDelimiters
  ORDER_COLUMNS = { maisrelevantes: %i[order desc], anuidade: %i[anuity asc],
                    rendaminima: %i[minimum_rent asc] }.freeze

  nilify_blanks only: %i[points insurance discount landing_url wizard_link]

  enum card_type: %i[credit debit pre_paid promotion]

  default_scope { order(order: :desc).where(active: true) }
  scope :with_inactive, -> { unscope(where: :active) }

  belongs_to :bank, -> { with_deleted }, touch: true
  belongs_to :flag, -> { with_deleted }
  has_many :product_redirects, as: :product

  validates :name, :bank_id, :card_type, :anuity, :anuity_multiple, :minimum_rent, :flag_id, presence: true

  after_create :create_meta_tag

  has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :photo, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  # Allow filter cards
  #
  # * *Args* :
  #   - +params+ -> Array<String> contains *path variable, splited by `/`
  # * *Returns* :
  #   - Cards filtered and ordered
  # * *Example* :
  #   - Passing param ['Itau', 'ordernado-por-anuidade'] will returns all cards belongs to Itau bank ordered by anuity
  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity,  Metrics/MethodLength, Metrics/PerceivedComplexity
  def self.filter(params)
    params = [] if params.nil?

    order = params.select { |filter| filter.include?('ordenado-por') }
    params -= order
    order = order.try(:last)

    # select all renda-minima filters and remove from params
    rents = params.select { |filter| filter.include?('renda-minima') }
    params -= rents

    # select all anuity filters and remove from params
    anuities = params.select { |filter| filter.include?('anuidade') }
    params -= rents

    result = self

    if order
      result = result.unscope(:order)
      order_options = ORDER_COLUMNS[order.split('-')[2..10].join('').to_sym]
      result = result.order(order_options[0] => order_options[1])
    end

    banks = []
    flags = []

    params.each do |param|
      banks << Bank.find_by(slug: param)
      flags << Flag.find_by(slug: param)
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

    # filter by anuities
    anuities.each do |anuity|
      anuity = anuity.split('-')
      result = if anuity[1] == 'gratuita'
                 result.where('anuity IS NULL or anuity = 0')
               else
                 result.where('anuity >= ? AND anuity <= ?', anuity[1], anuity[2])
               end
    end

    result = result.where(bank_id: banks.compact.pluck(:id)) if banks.compact.present?
    result = result.where(flag_id: flags.compact.pluck(:id)) if flags.compact.present?

    result
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity,  Metrics/MethodLength, Metrics/PerceivedComplexity

  # Method used by friendly_id gem
  # returns true because we want to generate new slug event it already exists
  def should_generate_new_friendly_id?
    true
  end

  # Method used to retrieve link to card with associated utm source
  def link_with_utm
    return link if bank.utm_source.blank?
    utm = link.include?('?') ? "&utm_source=#{bank.utm_source}" : "?utm_source=#{bank.utm_source}"
    "#{link}#{utm}"
  end

  def link_more_info(cid = nil)
    path = Rails.application.routes.url_helpers.card_path(self, cid: cid)

    if landing_url.present?
      landing_url.gsub('%{cid}', cid.to_s)
    else
      path
    end
  end

  # Method called in view to retrieve link to card
  # if bank of card has an affiliate associated it should return the affiliate link
  # if not it should return the go_to_site action
  def link_to_view(cid = nil)
    path = Rails.application.routes.url_helpers.go_to_site_card_path(self, cid: cid)

    if bank.affiliate_link.present?
      bank.affiliate_link.gsub('%{url_path}', path).gsub('%{card_id}', id.to_s).gsub('%{cid}', cid.to_s)
    else
      path
    end
  end

  def go_to_site_path
    Rails.application.routes.url_helpers.go_to_site_card_path(self)
  end

  def create_meta_tag
    path = Rails.application.routes.url_helpers.card_path(self)
    MetaTag.create!(name: 'description', value: I18n.t('cards.meta_tag', name: name), page: path)
    MetaTag.create!(name: 'keywords', value: I18n.t('cards.keywords_meta_tag', name: name), page: path)
  end
  # rubocop:enable Style/PercentLiteralDelimiters
end

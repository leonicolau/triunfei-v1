# frozen_string_literal: true

class CellPhonePlan < ApplicationRecord
  include WizardFilterable

  acts_as_paranoid
  extend FriendlyId
  friendly_id :name, use: :slugged

  ORDER_COLUMNS = {
    maisrelevantes: { order: :desc },
    internet: { gb: :desc },
    operadora: { operator_id: :asc }
  }.freeze

  # rubocop:disable Style/PercentLiteralDelimiters
  enum plan_type: %i[paid control]
  # rubocop:enable Style/PercentLiteralDelimiters

  default_scope { order(order: :desc) }
  belongs_to :operator, -> { with_deleted }

  validates :operator_id, :name, :plan_type, :description_brand, :price, presence: true

  has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :photo, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/PerceivedComplexity
  def self.filter(params)
    params = [] if params.nil?

    order = params.select { |filter| filter.include?('ordenado-por') }
    params -= order
    order = order.try(:last)

    gbs = params.select { |filter| filter.include?('gb') }
    params -= gbs

    prices = params.select { |filter| filter.include?('preço') }
    params -= prices

    plan_types = params.select { |filter| filter.include?('tipo-plano') }
    params -= plan_types

    result = self

    if order
      result = result.unscope(:order)
      result = result.order(ORDER_COLUMNS[order.split('-')[2..10].join('').to_sym])
    end

    operators = []

    params.each do |param|
      operators << Operator.find_by(slug: param)
    end

    gbs.each do |gb|
      gb = gb.split('-')
      result = if gb[1] == 'sem-gb'
                 result.where('gb IS NULL or gb = 0')
               else
                 result.where('gb >= ? AND gb <= ?', gb[1].to_f, gb[2].to_f)
               end
    end

    prices.each do |price|
      price = price.split('-')
      result = if price[1] == 'sem-minuto'
                 result.where('price IS NULL or price = 0')
               else
                 result.where('price >= ? AND price <= ?', price[1], price[2])
               end
    end

    result = result.where(operator_id: operators.compact.pluck(:id)) if operators.compact.present?

    result
  end
  # rubocop:enable Metrics/PerceivedComplexity
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def should_generate_new_friendly_id?
    true
  end
end

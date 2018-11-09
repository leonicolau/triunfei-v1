# frozen_string_literal: true

class InsuranceTravel < ApplicationRecord
  acts_as_paranoid

  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :insurer, -> { with_deleted }
  belongs_to :insurance_type, -> { with_deleted }
  belongs_to :country_destiny, -> { with_deleted }

  validates :insurer_id, :name, :benefits, presence: true

  has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :photo, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength

  def self.filter(params)
    params = [] if params.nil?

    order = params.select { |filter| filter.include?('ordenado-por') }
    params -= order
    order = order.try(:last)

    continents = params.select { |filter| filter.include?('continente') }
    params -= continents

    result = self

    if order
      result = result.unscope(:order)
      result = result.order(ORDER_COLUMNS[order.split('-')[2..10].join('').to_sym])
    end

    insurers = []
    insurance_types = []

    params.each do |param|
      insurers << Insurer.find_by(slug: param)
      insurance_types << InsuranceType.find_by(slug: param)
    end

    result = result.where(insurer_id: insurers.compact.pluck(:id)) if insurers.compact.present?
    result = result.where(insurance_type_id: insurance_types.compact.pluck(:id)) if insurance_types.compact.present?

    result
  end

  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength
  def should_generate_new_friendly_id?
    true
  end
end

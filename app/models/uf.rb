# frozen_string_literal: true

class Uf < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :cities
  # rubocop:disable Metrics/LineLength
  # rubocop:disable Style/PercentLiteralDelimiters
  enum choose_product: %i[insurance insurance_car insurance_travel insurance_car_insurance_travel cell_phone_plan card account loan]
  # rubocop:enable Metrics/LineLength
  # rubocop:enable Style/PercentLiteralDelimiters
  validates :name, presence: true

  def should_generate_new_friendly_id?
    true
  end
end

# frozen_string_literal: true

class ProductTip < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: :slugged
  # rubocop:disable Style/PercentLiteralDelimiters
  enum product: %i[insurance insurance_car cell_phone_plan card account loan investment]
  # rubocop:enable Style/PercentLiteralDelimiters

  validates :product, :title, :description, presence: true
end

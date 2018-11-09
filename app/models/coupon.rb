# frozen_string_literal: true

class Coupon < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :store, -> { with_deleted }

  validates :store_id, :name, :discount_percentage, presence: true

  def should_generate_new_friendly_id?
    true
  end
end

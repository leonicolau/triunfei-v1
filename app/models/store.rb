# frozen_string_literal: true

class Store < ApplicationRecord
  acts_as_paranoid

  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :coupons, dependent: :destroy

  validates :name, presence: true

  def should_generate_new_friendly_id?
    true
  end
end

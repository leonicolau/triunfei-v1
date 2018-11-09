# frozen_string_literal: true

class InsuranceType < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :insurances
  has_many :insurance_travels
  has_many :consortia
  validates :name, presence: true

  def should_generate_new_friendly_id?
    true
  end
end

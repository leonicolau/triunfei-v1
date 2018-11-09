# frozen_string_literal: true

class City < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :uf, -> { with_deleted }
  validates :name, presence: true

  def should_generate_new_friendly_id?
    true
  end
end

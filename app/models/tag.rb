# frozen_string_literal: true

class Tag < ApplicationRecord
  validates :name, presence: true
  has_and_belongs_to_many :users
  has_and_belongs_to_many :wizards
end

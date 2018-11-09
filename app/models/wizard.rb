# frozen_string_literal: true

class Wizard < ApplicationRecord
  acts_as_paranoid

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :wizard_fields
  has_many :user_wizards
  accepts_nested_attributes_for :wizard_fields, allow_destroy: true
  has_and_belongs_to_many :tags
  # rubocop:disable Style/PercentLiteralDelimiters
  enum wizard_type: %i[cards loans accounts cell_phone_plans]
  # rubocop:enable Style/PercentLiteralDelimiters
  validates :name, :wizard_type, presence: true

  def results(user)
    wizard_type.singularize.camelize.constantize.wizard_filter(user_wizards.where(user: user).last)
  end
end

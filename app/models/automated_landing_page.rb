# frozen_string_literal: true

class AutomatedLandingPage < ApplicationRecord
  acts_as_paranoid

  extend FriendlyId
  friendly_id :title, use: :slugged
  # rubocop:disable Style/PercentLiteralDelimiters
  enum landing_page_type: %i[card account loan cell_phone_plan investment insurance]
  # rubocop:enable Style/PercentLiteralDelimiters

  validates :title, :landing_page_type, :description, presence: true

  def should_generate_new_friendly_id?
    true
  end
end

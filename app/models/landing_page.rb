# frozen_string_literal: true

class LandingPage < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, :title, :page_type, presence: true
  validates :name, :text1, :text2, presence: true, unless: -> { html.present? }
  default_scope { order(order: :asc) }
  scope :ordered_by_title, -> { order(title: :asc).unscope(:order) }
  # rubocop:disable Style/PercentLiteralDelimiters
  enum page_type: %i[card account loan cell_phone_plan investment insurance]
  # rubocop:enable Style/PercentLiteralDelimiters

  has_attached_file :photo, styles: { medium: '480x380>', thumb: '120x120>' }
  validates_attachment_content_type :photo, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  def should_generate_new_friendly_id?
    true
  end
end

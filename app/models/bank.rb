# frozen_string_literal: true

class Bank < ApplicationRecord
  acts_as_paranoid

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :cards, dependent: :destroy
  has_many :loans, dependent: :destroy
  has_many :accounts, dependent: :destroy
  has_many :investments
  has_and_belongs_to_many :user_wizards

  scope :for_filter, -> { where(show_in_filter: true) }
  scope :for_wizard, -> { where(show_at_wizard: true) }

  after_save :touch_dependencies

  validates :name, presence: true

  has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :photo, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  def should_generate_new_friendly_id?
    true
  end

  def touch_dependencies
    cards.map(&:touch)
    loans.map(&:touch)
    accounts.map(&:touch)
  end

  delegate :url, to: :photo, prefix: true
end

# frozen_string_literal: true

class Broker < ApplicationRecord
  acts_as_paranoid

  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :investments, dependent: :destroy

  validates :name, presence: true

  has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :photo, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  def should_generate_new_friendly_id?
    true
  end
end

# frozen_string_literal: true

class MetaTag < ApplicationRecord
  acts_as_paranoid

  nilify_blanks only: [:page]

  validates :name, presence: true, unless: -> { property.present? || raw_text.present? }
  validates :raw_text, presence: true, unless: -> { property.present? || name.present? }
  validates :property, presence: true, unless: -> { name.present? || raw_text.present? }
end

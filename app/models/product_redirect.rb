# frozen_string_literal: true

class ProductRedirect < ApplicationRecord
  belongs_to :product, polymorphic: true
end

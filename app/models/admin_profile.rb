# frozen_string_literal: true

class AdminProfile < ApplicationRecord
  validates :name, presence: true

  def admin?
    name == 'Admin'
  end

  def broker?
    name == 'Broker'
  end

  def lp_editor?
    name == 'LP_Editor'
  end
end

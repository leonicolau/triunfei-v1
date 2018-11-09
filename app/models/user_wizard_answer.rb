# frozen_string_literal: true

class UserWizardAnswer < ApplicationRecord
  belongs_to :user_wizard
  belongs_to :wizard_field, -> { with_deleted }

  validates :value, presence: true
end

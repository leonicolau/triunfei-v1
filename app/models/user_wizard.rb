# frozen_string_literal: true

class UserWizard < ApplicationRecord
  belongs_to :user
  belongs_to :wizard
  has_and_belongs_to_many :banks

  has_many :user_wizard_answers, dependent: :destroy
  accepts_nested_attributes_for :user_wizard_answers
end

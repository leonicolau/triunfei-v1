# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_validation :set_password, on: :create
  has_many :user_wizards
  def set_password
    self.password = self.password_confirmation = Devise.friendly_token
  end

  def name
    email
  end
end

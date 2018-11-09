# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    @user = User.find_or_initialize_by(email: params[:user][:email])
    if @user.save
      sign_in @user
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path, alert: t('please_inform_valid_email'))
    end
  end
end

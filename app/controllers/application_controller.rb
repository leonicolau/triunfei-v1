# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def set_tip
    @product_tip = ProductTip.friendly.find(params[:tip]) if params[:tip].present?
  end
end

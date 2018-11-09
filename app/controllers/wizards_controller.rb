# frozen_string_literal: true

class WizardsController < ApplicationController
  before_action :set_wizard
  before_action :perform_postback, only: [:update]

  def show
    render user_signed_in? ? 'show' : 'sign_in'
  end

  def update
    redirect_to(@wizard) && return unless user_signed_in?

    @user_wizard = current_user.user_wizards.find_or_initialize_by(wizard: @wizard)
    @user_wizard.user_wizard_answers.delete_all
    @user_wizard.update(user_wizard_params)

    redirect_to result_wizard_path(@wizard)
  end

  def result
    redirect_to(@wizard) unless user_signed_in?
    @result = @wizard.results(current_user)
  end

  private

  # rubocop:disable Metrics/LineLength

  def perform_postback
    PostbackUrlJob.perform_later(@wizard.postback_url.gsub('%{cid}', params['cid'])) if params['cid'].present? && @wizard.postback_url.present?
  end
  # rubocop:enable Metrics/LineLength
  # rubocop:enable Style/FormatStringToken

  def set_wizard
    @wizard = Wizard.friendly.find(params[:id])
  end

  def user_wizard_params
    params.require(:user_wizard).permit!
  end

  def user_params
    params.require(:user).permit(:email)
  end

  def set_device_name
    user_agent = request.user_agent
    client = DeviceDetector.new(user_agent)
    client.device_name
  end

  def set_browser
    user_agent = request.user_agent
    client = DeviceDetector.new(user_agent)
    client.name
  end

  def set_os_name
    user_agent = request.user_agent
    client = DeviceDetector.new(user_agent)

    client.os_name
  end

  def set_device_type
    user_agent = request.user_agent
    client = DeviceDetector.new(user_agent)

    client.device_type
  end
  helper_method :set_device_name
  helper_method :set_browser
  helper_method :set_os_name
  helper_method :set_device_type
end

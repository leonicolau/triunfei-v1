# frozen_string_literal: true

class CellPhonePlansController < ApplicationController
  # rubocop:disable Style/PercentLiteralDelimiters
  before_action :set_cell_phone_plan, only: %i[show go_to_site]
  # rubocop:enable Style/PercentLiteralDelimiters
  before_action :set_tip

  def index
    @cell_phone_plans = CellPhonePlan.filter(params[:path]&.split('/')).limit(20)
  end

  def show; end

  # rubocop:disable Metrics/AbcSize
  def go_to_site
    if params['cid'].present? && @cell_phone_plan.operator.postback_url.present?
      PostbackUrlJob.perform_later @cell_phone_plan.operator.postback_url.gsub('%{cid}', params['cid'])
    end
    redirect_to @cell_phone_plan.link.gsub('%{amount}', params[:amount].to_s).gsub('%{cid}', params[:cid].to_s)
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Style/FormatStringToken

  private

  def set_cell_phone_plan
    @cell_phone_plan = CellPhonePlan.friendly.find(params[:id])
  end
end

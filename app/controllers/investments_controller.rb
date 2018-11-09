# frozen_string_literal: true

class InvestmentsController < ApplicationController
  # rubocop:disable Style/PercentLiteralDelimiters
  before_action :set_investment, only: %i[show go_to_site]
  before_action :set_tip, only: [:index]
  # rubocop:enable Style/PercentLiteralDelimiters

  def index
    @investments = Investment.filter(params[:path]&.split('/')).includes(:broker).limit(20)
  end

  def show; end

  def go_to_site
    redirect_to @investment.link.gsub('%{cid}', params['cid'].to_s)
  end

  private

  def set_investment
    @investment = Investment.friendly.find(params[:id])
  end
end

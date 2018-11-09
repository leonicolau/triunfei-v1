# frozen_string_literal: true

class InsurancesController < ApplicationController
  # rubocop:disable Style/PercentLiteralDelimiters
  before_action :set_insurance, only: %i[show go_to_site]
  # rubocop:enable Style/PercentLiteralDelimiters

  before_action :set_tip

  def index
    @insurances = Insurance.filter(params[:path]&.split('/')).limit(20)
  end

  def show; end

  def go_to_site
    redirect_to @insurance.link.gsub('%{amount}', params[:amount].to_s).gsub('%{cid}', params[:cid].to_s)
  end

  private

  def set_insurance
    @insurance = Insurance.friendly.find(params[:id])
  end
end

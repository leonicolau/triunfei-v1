# frozen_string_literal: true

class LoansController < ApplicationController
  # rubocop:disable Style/PercentLiteralDelimiters
  before_action :set_loan, only: %i[show go_to_site]
  # rubocop:enable Style/PercentLiteralDelimiters

  before_action :set_blog_posts
  before_action :set_tip

  def index
    @loans = Loan.filter(params[:path]&.split('/')).includes(:bank).limit(20)
  end

  def set_blog_posts
    @blog_posts = BlogPost.visible.loan
  end

  def show; end

  def set_tip
    @product_tip = ProductTip.friendly.find(params[:tip]) if params[:tip].present?
  end

  # rubocop:disable Metrics/AbcSize
  def go_to_site
    if params['cid'].present? && @loan.bank.loan_postback_url.present?
      PostbackUrlJob.perform_later @loan.bank.loan_postback_url.gsub('%{cid}', params['cid'])
    end
    @loan.product_redirects.create!
    redirect_to @loan.link.gsub('%{amount}', params[:amount].to_s) if @loan.wizard_link.blank?
    redirect_to @loan.wizard_link.gsub('%{amount}', params[:amount].to_s) if @loan.wizard_link.present?
  end
  # rubocop:enable Metrics/AbcSize

  private

  def set_loan
    @loan = Loan.friendly.find(params[:id])
  end
end

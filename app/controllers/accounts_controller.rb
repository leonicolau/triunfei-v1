# frozen_string_literal: true

class AccountsController < ApplicationController
  # rubocop:disable Style/PercentLiteralDelimiters
  before_action :set_account, only: %i[show go_to_site]
  before_action :set_blog_posts
  before_action :set_tip, only: %i[index]
  # rubocop:enable Style/PercentLiteralDelimiters

  def index
    @accounts = Account.filter(params[:path]&.split('/')).includes(:bank).limit(20)
  end

  def set_blog_posts
    @blog_posts = BlogPost.visible.account
  end

  def show; end

  # rubocop:disable Metrics/AbcSize
  def go_to_site
    if params['cid'].present? && @account.bank.account_postback_url.present?
      PostbackUrlJob.perform_later @account.bank.account_postback_url.gsub('%{cid}', params['cid'])
    end
    @account.product_redirects.create!
    redirect_to @account.link if @account.wizard_link.blank?
    redirect_to @account.wizard_link if @account.wizard_link.present?
  end
  # rubocop:enable Metrics/AbcSize

  private

  def set_account
    @account = Account.friendly.find(params[:id])
  end
end

# frozen_string_literal: true

class CardsController < ApplicationController
  # rubocop:disable Style/PercentLiteralDelimiters
  before_action :set_card, only: %i[show go_to_site]
  before_action :set_blog_posts
  before_action :set_tip, only: [:index]
  # rubocop:enable Style/PercentLiteralDelimiters

  def index
    @cards = Card.filter(params[:path]&.split('/')).includes(:bank).limit(20)
  end

  def set_blog_posts
    @blog_posts = BlogPost.visible.credit_card
  end

  def show; end

  def go_to_site
    perform_postback
    @card.product_redirects.create!
    redirect_to @card.link_with_utm.gsub('%{cid}', params['cid'].to_s)
  end

  private

  def set_card
    @card = Card.friendly.find(params[:id])
  end

  def perform_postback
    return unless params['cid'].present? && @card.bank.card_postback_url.present?
    PostbackUrlJob.perform_later @card.bank.card_postback_url.gsub('%{cid}', params['cid'])
  end
end

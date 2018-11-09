# frozen_string_literal: true
class LandingPagesController < ApplicationController
  before_action :set_landing_page, only: %i(show go_to_site)

  before_action :set_blog_posts

  def show
    render(layout: 'landing', text: '') && return if @landing.html.present?
  end

  def go_to_site
    if params['cid'].present? && @landing.postback_url.present?
      PostbackUrlJob.perform_later @landing.postback_url.gsub('%{cid}', params['cid'])
    end

    redirect_to @landing.affiliate_link.gsub('%{landing_page_id}', @landing.id.to_s)
      .gsub('%{cid}', params[:cid].to_s)
  end

  def santander_card
    render layout: false
  end

  private

  def set_landing_page
    @landing = LandingPage.friendly.find(params[:id])
  end

  def set_blog_posts
    @blog_posts = BlogPost.visible
  end
end

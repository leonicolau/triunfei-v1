# frozen_string_literal: true

class SiteController < ApplicationController
  before_action :set_blog_posts

  def index; end

  def sitemap
    render formats: :xml
  end

  private

  def set_blog_posts
    @blog_posts = BlogPost.visible
  end
end

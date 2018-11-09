# frozen_string_literal: true

class BanksController < ApplicationController
  before_action :set_bank
  before_action :set_blog_posts

  def show
    @cards = Card.filter(params[:path]&.split('/')).where(bank_id: @bank.id).limit(10)
  end

  private

  def set_bank
    @bank = Bank.friendly.find(params[:id])
  end

  def set_blog_posts
    @blog_posts = BlogPost.visible
  end
end

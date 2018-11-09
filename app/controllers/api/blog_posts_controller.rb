# frozen_string_literal: true

module Api
  class BlogPostsController < ApplicationController
    def index
      render json: BlogPost.visible
    end
  end
end

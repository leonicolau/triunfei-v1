# frozen_string_literal: true

# This controller is just for designers create pages with fake data
# to use:
# - Create a new html inside `app/views/design`
# - Access it trough /design/HTML_PAGE_NAME where HTML_PAGE_NAME
# is the name of your html
class DesignController < ApplicationController
  def show
    render params[:id]
  end
end

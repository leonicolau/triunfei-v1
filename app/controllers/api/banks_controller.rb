# frozen_string_literal: true

module Api
  class BanksController < ApplicationController
    def index
      render json: Bank.for_wizard.to_json(methods: [:photo_url])
    end
  end
end

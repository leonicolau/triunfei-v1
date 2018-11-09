# frozen_string_literal: true

module Api
  class WizardFieldsController < ApplicationController
    def index
      render json: WizardField.filter(params).to_json(methods: [:wizard_field_type])
    end
  end
end

require 'test_helper'

module Api
  class WizardFieldsControllerTest < ActionDispatch::IntegrationTest
    test '#index renders wizard_fields given an filter' do
      get api_wizard_fields_path, params: { step: 3, wizard_id: wizards(:bradesco).id }

      result = JSON.parse(response.body)
      assert_equal 1, result.size
      assert_equal 'number', result[0]['name']
    end
  end
end

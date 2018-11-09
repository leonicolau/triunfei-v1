require 'test_helper'

module Api
  class BanksControllerTest < ActionDispatch::IntegrationTest
    test '#index renders banks with show_at_wizard as json' do
      get api_banks_path

      result = JSON.parse(response.body)
      assert_equal 1, result.size
      assert_equal banks(:itau).name, result[0]['name']
    end
  end
end

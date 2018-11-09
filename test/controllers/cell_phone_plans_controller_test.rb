require 'test_helper'

class CellPhonePlansControllerTest < ActionDispatch::IntegrationTest

  test '#index display cell phone plan tips' do
    get cell_phone_plans_url
    assert_select '.tip-item', count: 2
    assert_match product_tips(:cell_phone_plan).title, response.body
  end

end

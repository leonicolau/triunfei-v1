require 'test_helper'

class InsurancesControllerTest < ActionDispatch::IntegrationTest

  test '#index display insurance tips' do
    get insurances_url
    assert_select '.tip-item', count: 2
    assert_match product_tips(:insurance).title, response.body
  end

end

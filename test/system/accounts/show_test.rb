require "application_system_test_case"

class AccountsShowTest < ApplicationSystemTestCase

include ActionView::Helpers::NumberHelper
    
  test 'user sees format taxes correctly' do
    visit account_path(accounts(:conta_itau))
    assert_text(number_to_currency(accounts(:conta_itau).taxes))
  end
end

require "application_system_test_case"

class InsurancesShowTest < ApplicationSystemTestCase

include ActionView::Helpers::NumberHelper
    

  test 'user sees insurer name' do
    visit insurance_path(insurances(:seguro))
    assert_text 'Santander'
  end

end

require 'test_helper'

class LandingPageTest < ActiveSupport::TestCase
  test 'validations' do
    landing_page = LandingPage.new
    landing_page.save
    
    assert_not_empty landing_page.errors[:name]
    assert_not_empty landing_page.errors[:title]
    assert_not_empty landing_page.errors[:text1]
    assert_not_empty landing_page.errors[:text2]
  end
end

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should create user" do
    assert_difference 'User.count' do
      post users_url, params: { user: { email: 'leonardo+1@triunfei.com' } }, xhr: true
    end
    
    assert_no_difference 'User.count' do
      post users_url, params: { user: { email: 'leonardo+1@triunfei.com' } }, xhr: true
    end
  end
end

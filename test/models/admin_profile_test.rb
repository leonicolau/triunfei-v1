require 'test_helper'

class AdminProfileTest < ActiveSupport::TestCase
  test '#admin? returns true if profile is admin' do
    assert admin_profiles(:admin).admin?
    refute admin_profiles(:broker).admin?
  end

  test '#broker? returns true if profile is broker' do
    assert admin_profiles(:broker).broker?
    refute admin_profiles(:admin).broker?
  end
end

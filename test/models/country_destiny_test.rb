require 'test_helper'

class CountryDestinyTest < ActiveSupport::TestCase

  test "validations" do
    country_destiny = CountryDestiny.new
    country_destiny.save

    assert_not_empty country_destiny.errors[:name]  
  end
end
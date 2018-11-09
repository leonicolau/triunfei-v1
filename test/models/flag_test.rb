require 'test_helper'

class FlagTest < ActiveSupport::TestCase

  test "relations" do
    assert_equal flags(:visa).cards, [cards(:visa_credit)]
  end

  test "validations" do
    flag = Flag.new
    flag.save

    assert_not_empty flag.errors[:name]
  end

end
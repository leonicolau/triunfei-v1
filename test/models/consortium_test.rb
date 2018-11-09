require 'test_helper'

class ConsortiumTest < ActiveSupport::TestCase

  test "benefits" do
    consortium = consortia(:santander)
    assert_equal = 'a melhor', consortium.benefits
  end

  test "link" do
    consortium = consortia(:santander)
    assert_equal 'http://test.com/', consortium.link
  end
  
  test "payment_term" do
    consortium = consortia(:santander)
    assert_equal 12.0, consortium.payment_term
  end

  test "monthly_installment" do
    consortium = consortia(:santander)
    assert_equal 1600.0, consortium.monthly_installment
  end

  test "value" do
    consortium = consortia(:santander)
    assert_equal 30000.9, consortium.value
  end
  
end

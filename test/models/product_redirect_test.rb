require 'test_helper'

class ProductRedirectTest < ActiveSupport::TestCase
  test 'it belongs to product' do
    product_redirect = ProductRedirect.new(product: cards(:visa_credit))
    assert_equal cards(:visa_credit), product_redirect.product
  end
end

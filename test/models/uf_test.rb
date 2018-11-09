require 'test_helper'

class UfTest < ActiveSupport::TestCase
 
 test "name" do
  	uf = ufs(:rs)
  	assert_equal 'rs', uf.name
  end
end 
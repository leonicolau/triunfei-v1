require 'test_helper'

class ManufacturerTest < ActiveSupport::TestCase
 
 test "name" do
  	manufacturer = manufacturers(:honda)
  	assert_equal 'honda', manufacturer.name
  end
end
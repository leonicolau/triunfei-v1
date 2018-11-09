require 'test_helper'

class InsuranceTravelTest < ActiveSupport::TestCase

  test "filter" do
    # by insurer
    assert_equal InsuranceTravel.filter([insurers(:santander).slug]).to_a, InsuranceTravel.where(insurer_id: insurers(:santander).id).to_a
    assert_equal InsuranceTravel.filter([insurers(:santander).slug, insurers(:bradesco).slug]).to_a, InsuranceTravel.where(insurer_id: [insurers(:santander).id, insurers(:bradesco).id]).to_a
  	
  	# by insurance_type
  	assert_equal InsuranceTravel.filter([insurance_types(:viagem).slug]).to_a, InsuranceTravel.where(insurance_type_id: insurance_types(:viagem).id).to_a
  end

  test "benefits" do
  	insurance_travel = insurance_travels(:bahia)
  	assert_equal 'o melhor', insurance_travel.benefits
  end

  test "link" do
  	insurance_travel = insurance_travels(:poa)
  	assert_equal 'http://www.poa.com.br', insurance_travel.link
  end

  test "country destiny" do
    insurance_travel = insurance_travels(:bahia)
    assert_equal 'portugal', insurance_travel.country_destiny.name
  end
end
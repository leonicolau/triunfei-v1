require 'test_helper'

class InsuranceCarTest < ActiveSupport::TestCase

  test "filter" do
    # by insurer
    assert_equal InsuranceCar.filter([insurers(:santander).slug]).to_a, InsuranceCar.where(insurer_id: insurers(:santander).id).to_a
    assert_equal InsuranceCar.filter([insurers(:santander).slug, insurers(:bradesco).slug]).to_a, InsuranceCar.where(insurer_id: [insurers(:santander).id, insurers(:bradesco).id]).to_a
  	
  	# by insurance_type
  	assert_equal InsuranceCar.filter([insurance_types(:carro).slug]).to_a, InsuranceCar.where(insurance_type_id: insurance_types(:carro).id).to_a
  	
  	# by manufacturer
  	assert_equal InsuranceCar.filter([manufacturers(:honda).slug]).to_a, InsuranceCar.where(manufacturer_id: manufacturers(:honda).id).to_a
  end

  test "benefits" do
  	insurance_car = insurance_cars(:gol)
  	assert_equal 'o melhor', insurance_car.benefits
  end

  test "link" do
  	insurance_car = insurance_cars(:palio)
  	assert_equal 'http://www.palio.com.br', insurance_car.link
  end
end
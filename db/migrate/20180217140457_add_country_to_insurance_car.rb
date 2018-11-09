class AddCountryToInsuranceCar < ActiveRecord::Migration[5.1]
  def change
    add_reference :insurance_cars, :country, foreign_key: true
  end
end

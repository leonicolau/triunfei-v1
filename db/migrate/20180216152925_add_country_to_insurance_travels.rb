class AddCountryToInsuranceTravels < ActiveRecord::Migration[5.1]
  def change
    add_reference :insurance_travels, :country, foreign_key: true
  end
end

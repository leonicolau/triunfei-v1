class AddCountryToInsuranceTypes < ActiveRecord::Migration[5.0]
  def change
    add_reference :insurance_types, :country, foreign_key: true
  end
end

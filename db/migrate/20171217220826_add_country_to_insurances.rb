class AddCountryToInsurances < ActiveRecord::Migration[5.1]
  def change
    add_reference :insurances, :country, foreign_key: true
  end
end

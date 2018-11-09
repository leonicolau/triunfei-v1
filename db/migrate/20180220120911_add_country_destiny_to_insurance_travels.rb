class AddCountryDestinyToInsuranceTravels < ActiveRecord::Migration[5.1]
  def change
    add_column :insurance_travels, :country_destiny_id, :integer
  end
end

class AddCountryToManufacturer < ActiveRecord::Migration[5.1]
  def change
    add_reference :manufacturers, :country, foreign_key: true
  end
end

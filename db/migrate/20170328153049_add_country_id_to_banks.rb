class AddCountryIdToBanks < ActiveRecord::Migration[5.0]
  def change
    add_reference :banks, :country, foreign_key: true
  end
end

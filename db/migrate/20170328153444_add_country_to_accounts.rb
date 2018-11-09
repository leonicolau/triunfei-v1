class AddCountryToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_reference :accounts, :country, foreign_key: true
  end
end

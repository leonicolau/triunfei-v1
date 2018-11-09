class AddCountryToLoans < ActiveRecord::Migration[5.0]
  def change
    add_reference :loans, :country, foreign_key: true
  end
end

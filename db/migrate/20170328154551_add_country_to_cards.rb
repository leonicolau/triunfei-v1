class AddCountryToCards < ActiveRecord::Migration[5.0]
  def change
    add_reference :cards, :country, foreign_key: true
  end
end

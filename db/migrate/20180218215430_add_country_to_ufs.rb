class AddCountryToUfs < ActiveRecord::Migration[5.1]
  def change
    add_reference :ufs, :country, foreign_key: true
  end
end

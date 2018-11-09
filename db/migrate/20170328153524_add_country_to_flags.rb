class AddCountryToFlags < ActiveRecord::Migration[5.0]
  def change
    add_reference :flags, :country, foreign_key: true
  end
end

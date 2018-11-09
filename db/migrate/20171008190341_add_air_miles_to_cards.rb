class AddAirMilesToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :air_miles, :integer
  end
end

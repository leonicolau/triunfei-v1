class AddShowCellPhonePlansToCountry < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :show_cell_phone_plans, :boolean
  end
end

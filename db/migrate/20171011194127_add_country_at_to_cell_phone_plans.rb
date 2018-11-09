class AddCountryAtToCellPhonePlans < ActiveRecord::Migration[5.0]
  def change
    add_reference :cell_phone_plans, :country, foreign_key: true
  end
end

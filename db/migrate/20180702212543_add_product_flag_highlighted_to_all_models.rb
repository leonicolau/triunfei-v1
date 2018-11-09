class AddProductFlagHighlightedToAllModels < ActiveRecord::Migration[5.2]
  def change
      add_column :cards, :highlighted, :boolean, default: false
      add_column :accounts, :highlighted, :boolean, default: false
      add_column :loans, :highlighted, :boolean, default: false
      add_column :insurances, :highlighted, :boolean, default: false
      add_column :consortia, :highlighted, :boolean, default: false
      add_column :cell_phone_plans, :highlighted, :boolean, default: false
      add_column :insurance_travels, :highlighted, :boolean, default: false
      add_column :insurance_cars, :highlighted, :boolean, default: false
  end
end

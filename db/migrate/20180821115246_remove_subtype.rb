class RemoveSubtype < ActiveRecord::Migration[5.2]
  def change
    remove_column :investments, :investment_subtype_id
    drop_table :investment_subtypes
  end
end

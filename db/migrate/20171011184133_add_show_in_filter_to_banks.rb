class AddShowInFilterToBanks < ActiveRecord::Migration[5.0]
  def change
    add_column :banks, :show_in_filter, :boolean, default: true
  end
end

class AddUtmSourceToBanks < ActiveRecord::Migration[5.0]
  def change
    add_column :banks, :utm_source, :string, default: :triunfei
  end
end

class AddDevicesToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :devices, :string
  end
end

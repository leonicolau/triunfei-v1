class RemoveIpcaAndCdi < ActiveRecord::Migration[5.2]
  def change
    remove_column :investments, :cdi_rate
    remove_column :investments, :ipca_rate
  end
end

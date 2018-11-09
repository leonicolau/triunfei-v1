class AddOrderToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :order, :integer
  end
end

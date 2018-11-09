class AddWithdrawalAndTransferAndStatementToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :withdrawal, :integer
    add_column :accounts, :transfer, :integer
    add_column :accounts, :statement, :integer
  end
end

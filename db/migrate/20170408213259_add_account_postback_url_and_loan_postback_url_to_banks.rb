class AddAccountPostbackUrlAndLoanPostbackUrlToBanks < ActiveRecord::Migration[5.0]
  def change
    add_column :banks, :account_postback_url, :string
    add_column :banks, :loan_postback_url, :string
  end
end

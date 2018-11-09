class AddAccountBankDescriptionToBank < ActiveRecord::Migration[5.0]
  def change
    add_column :banks, :account_bank_description, :text
  end
end

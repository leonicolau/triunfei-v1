class AddLoanBankDescriptionToBank < ActiveRecord::Migration[5.0]
  def change
    add_column :banks, :loan_bank_description, :text
  end
end

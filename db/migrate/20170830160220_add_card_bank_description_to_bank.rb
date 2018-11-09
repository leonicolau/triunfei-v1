class AddCardBankDescriptionToBank < ActiveRecord::Migration[5.0]
  def change
    add_column :banks, :card_bank_description, :text
  end
end

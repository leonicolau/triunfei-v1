class AddCardDescriptionToBanks < ActiveRecord::Migration[5.0]
  def change
    add_column :banks, :card_description, :text
  end
end

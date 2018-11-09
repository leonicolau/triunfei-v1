class AddNewFields2ToInvestments < ActiveRecord::Migration[5.2]
  def change
    add_column :investments, :daily_deadline, :integer
    add_column :investments, :product_category_description, :text
  end
end

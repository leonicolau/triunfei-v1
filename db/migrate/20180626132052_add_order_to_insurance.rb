class AddOrderToInsurance < ActiveRecord::Migration[5.2]
  def change
    add_column :insurances, :order, :integer
  end
end

class AddTextToProductTip < ActiveRecord::Migration[5.0]
  def change
    add_column :product_tips, :text, :text
  end
end

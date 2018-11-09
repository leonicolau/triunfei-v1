class CreateProductRedirects < ActiveRecord::Migration[5.1]
  def change
    create_table :product_redirects do |t|
      t.integer :product_id
      t.string :product_type
    end
  end
end

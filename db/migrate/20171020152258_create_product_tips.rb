class CreateProductTips < ActiveRecord::Migration[5.0]
  def change
    create_table :product_tips do |t|
      t.references :country, foreign_key: true
      t.string :title
      t.text :description
      t.boolean :active, default: true
      t.integer :product
      t.string :slug, unique: true

      t.timestamps
    end
  end
end

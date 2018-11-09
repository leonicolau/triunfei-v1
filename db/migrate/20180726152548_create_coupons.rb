class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :name
      t.string :slug, unique: true
      t.text :description
      t.integer :discount_percentage
      t.string :coupon_code
      t.string :term
      t.text :rule
      t.references :store
      t.string :link
      t.datetime :deleted_at
      t.timestamps
    end
    add_attachment :coupons, :photo
  end
end

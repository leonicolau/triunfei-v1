class CreateCellPhonePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :cell_phone_plans do |t|
      t.string :name
      t.integer :plan_type

      t.text :description
      t.integer :minutes

      t.decimal :price, precision: 8, scale: 2

      t.string :link

      t.integer :gb

      t.string :description_brand

      t.string :slug, unique: true

      t.integer :order, default: 0
      t.references :operator, foreign_key: true
	    t.datetime :deleted_at

      t.timestamps
    end

    add_attachment :cell_phone_plans, :photo
  end
end

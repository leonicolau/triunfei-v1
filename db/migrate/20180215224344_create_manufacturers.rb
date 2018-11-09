class CreateManufacturers < ActiveRecord::Migration[5.0]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.string :slug, unique: true
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
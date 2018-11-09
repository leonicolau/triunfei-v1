class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
     t.string :name
     t.integer :uf_id
     t.string :slug, unique: true
     t.datetime :deleted_at
     t.references :country, foreign_key: true
     t.timestamps
    end
  end
end
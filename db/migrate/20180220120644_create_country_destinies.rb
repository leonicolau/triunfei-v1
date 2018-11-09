class CreateCountryDestinies < ActiveRecord::Migration[5.1]
  def change
    create_table :country_destinies do |t|
      t.string :name
      t.string :slug, unique: true
      t.datetime :deleted_at
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end

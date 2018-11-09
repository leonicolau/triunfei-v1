class CreateMetaTags < ActiveRecord::Migration[5.0]
  def change
    create_table :meta_tags do |t|
      t.string :name
      t.string :value
      t.references :country, foreign_key: true
      t.string :page
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

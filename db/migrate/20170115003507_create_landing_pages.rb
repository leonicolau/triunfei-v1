class CreateLandingPages < ActiveRecord::Migration[5.0]
  def change
    create_table :landing_pages do |t|
      t.string :name
      t.string :title
      t.text :text1
      t.text :text2
      t.string :slug, unique: true
      t.integer :page_type

      t.timestamps
    end
  end
end

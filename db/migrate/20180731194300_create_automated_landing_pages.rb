class CreateAutomatedLandingPages < ActiveRecord::Migration[5.2]
  def change
    create_table :automated_landing_pages do |t|
      t.string :title
      t.text :description
      t.integer :landing_page_type
      t.string :slug, unique: true
      t.datetime :deleted_at
      t.timestamps
    end
  end
end

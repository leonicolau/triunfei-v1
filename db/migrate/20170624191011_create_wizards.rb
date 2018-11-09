class CreateWizards < ActiveRecord::Migration[5.0]
  def change
    create_table :wizards do |t|
      t.references :country, foreign_key: true
      t.string :name
      t.string :slug
      t.datetime :deleted_at
      t.integer :wizard_type

      t.timestamps
    end
  end
end

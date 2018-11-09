class CreateWizardFields < ActiveRecord::Migration[5.0]
  def change
    create_table :wizard_fields do |t|
      t.references :wizard, foreign_key: true
      t.string :name
      t.string :label
      t.string :mask
      t.integer :page
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

class CreateInsuranceTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :insurance_types do |t|
      t.string :name
      t.string :slug, unique: true
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
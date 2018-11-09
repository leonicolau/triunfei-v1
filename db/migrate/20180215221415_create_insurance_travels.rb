class CreateInsuranceTravels < ActiveRecord::Migration[5.1]
	
 def change
    create_table :insurance_travels do |t|
      t.string :name
      t.text :benefits
      t.string :link
      t.string :slug, unique: true
      t.references :insurer, foreign_key: true
      t.datetime :deleted_at
      t.integer :insurance_type_id
      t.timestamps
    end

    add_attachment :insurance_travels, :photo
  end
end

class CreateInsuranceCars < ActiveRecord::Migration[5.1]
	
 def change
    create_table :insurance_cars do |t|
      t.string :name
      t.text :benefits
      t.string :link
      t.string :slug, unique: true
      t.references :insurer, foreign_key: true
      t.integer :manufacturer_id
	    t.datetime :deleted_at
      t.integer :insurance_type_id
      t.timestamps
    end

    add_attachment :insurance_cars, :photo
  end
end
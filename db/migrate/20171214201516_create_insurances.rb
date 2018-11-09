class CreateInsurances < ActiveRecord::Migration[5.1]
	
 def change
    create_table :insurances do |t|
      t.string :name
      t.text :benefits
      t.string :link
      t.string :slug, unique: true
      t.references :insurer, foreign_key: true
	    t.datetime :deleted_at
      t.timestamps
    end

    add_attachment :insurances, :photo
  end
end

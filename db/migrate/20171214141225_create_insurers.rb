class CreateInsurers < ActiveRecord::Migration[5.1]
  
  def change
    create_table :insurers do |t|
      t.string :name
      t.string :slug, unique: true
      t.references :country, foreign_key: true
  	  t.datetime :deleted_at
      t.timestamps
    end

    add_attachment :insurers, :photo
  end
end

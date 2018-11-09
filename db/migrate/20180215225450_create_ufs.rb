class CreateUfs < ActiveRecord::Migration[5.1]
	
 def change
    create_table :ufs do |t|
      t.string :name
      t.string :slug, unique: true
      t.datetime :deleted_at
      t.integer :choose_product
      t.timestamps
    end
  end
end


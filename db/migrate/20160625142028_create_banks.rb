class CreateBanks < ActiveRecord::Migration[5.0]
  def change
    create_table :banks do |t|
      t.string :name
      t.string :slug, unique: true

      t.timestamps
    end
    
    add_attachment :banks, :photo
  end
end

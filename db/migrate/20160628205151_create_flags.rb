class CreateFlags < ActiveRecord::Migration[5.0]
  def change
    create_table :flags do |t|
      t.string :name
      t.string :slug, unique: true

      t.timestamps
    end
    
    add_attachment :flags, :photo
  end
end

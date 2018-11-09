class CreateOperators < ActiveRecord::Migration[5.0]

  def change
    create_table :operators do |t|
      t.string :name
      t.string :slug, unique: true
  	  t.references :country, foreign_key: true
  	  t.datetime :deleted_at
      t.timestamps
    end

    add_attachment :operators, :photo
  end
end

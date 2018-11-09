class CreateInvestments < ActiveRecord::Migration[5.2]
  def change
    create_table :investments do |t|
      t.string :name
      t.string :slug, unique: true
      t.integer :investment_type
      t.text :description
      t.integer :investment_subtype_id
      t.integer :broker_id
      t.string :link
      t.datetime :deleted_at
    end
    add_attachment :investments, :photo
  end
end

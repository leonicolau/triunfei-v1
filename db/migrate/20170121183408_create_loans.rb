class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.references :bank, foreign_key: true
      t.string :name
      t.text :description
      t.string :link
      t.string :slug
      t.integer :loan_type
      t.decimal :min_amount, precision: 20, scale: 4
      t.decimal :max_amount, precision: 20, scale: 4
      t.decimal :min_payment, precision: 20, scale: 4
      t.decimal :max_payment, precision: 20, scale: 4
      t.decimal :interest_rate, precision: 20, scale: 4
      t.decimal :start_rate, precision: 20, scale: 4

      t.timestamps
    end
    
    add_attachment :loans, :photo
  end
end

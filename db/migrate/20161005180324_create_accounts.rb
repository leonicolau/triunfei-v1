class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.integer :bank_id
      t.string :name
      t.decimal :taxes, precision: 8, scale: 2
      t.decimal :minimum_rent, precision: 8, scale: 2
      t.decimal :minimum_deposit, precision: 8, scale: 2
      t.text :benefits
      t.string :link
      t.string :slug, unique: true
      t.string :service_packages
  
      t.timestamps
    end
  end
end

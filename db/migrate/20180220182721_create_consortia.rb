class CreateConsortia < ActiveRecord::Migration[5.1]
  def change
    create_table :consortia do |t|
      t.string :name
      t.text :benefits
      t.decimal :value, precision: 8, scale: 2
      t.decimal :payment_term, precision: 8, scale: 2
      t.decimal :monthly_installment, precision: 8, scale: 2
      t.string :link
      t.string :slug, unique: true
      t.references :insurer, foreign_key: true
      t.references :country
      t.references :deleted_at
      t.integer :insurance_type_id
      t.timestamps
    end
    add_attachment :consortia, :photo
  end
end

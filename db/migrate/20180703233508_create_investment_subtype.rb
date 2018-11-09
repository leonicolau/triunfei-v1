class CreateInvestmentSubtype < ActiveRecord::Migration[5.2]
  def change
    create_table :investment_subtypes do |t|
      t.string :name
      t.string :slug, unique: true
      t.datetime :deleted_at
      t.timestamps
    end
  end
end

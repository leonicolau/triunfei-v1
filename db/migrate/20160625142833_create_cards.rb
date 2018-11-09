class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.integer :bank_id
      t.string :name
      t.integer :card_type

      # TODO: how model it?
      t.string :bank_usp1
      t.string :bank_usp2

      t.string :discount
      t.string :points, default: nil
      t.string :design

      t.boolean :international, default: false

      # TODO: change to flag?
      t.string :insurance, default: nil
      t.string :flag_call_center

      # TODO: how model it?
      t.string :flag_prem1
      t.string :flag_prem2
      t.string :flag_prem3
      t.string :flag_prem4
      t.string :anuity_discount

      t.decimal :anuity, precision: 8, scale: 2
      t.integer :anuity_multiple
      t.decimal :minimum_rent, precision: 8, scale: 2

      t.decimal :interest_rate
      
      t.integer :flag_id

      t.string :link
      
      t.string :insurance2
      
      t.string :slug, :string, unique: true
      
      t.integer :order, default: 0
      
      # For now we will use string for this fields,
      # although they represents a boolean on form
      # if necessary on the future we can review that.
      
      

      t.timestamps
    end
    
    add_attachment :cards, :photo
  end
end

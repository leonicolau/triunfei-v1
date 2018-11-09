class CreateBrokers < ActiveRecord::Migration[5.2]
  def change
    create_table :brokers do |t|
      t.string :name
      t.string :slug, unique: true
      t.datetime :deleted_at
      t.timestamps
    end
    add_attachment :brokers, :photo
  end
end

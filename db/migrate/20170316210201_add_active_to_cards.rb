class AddActiveToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :active, :boolean, default: true
  end
end

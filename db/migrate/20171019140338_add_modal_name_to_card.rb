class AddModalNameToCard < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :modal_name, :string
  end
end

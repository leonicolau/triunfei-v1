class AddTitleModalBoxToCard < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :title_modal_box, :string
  end
end

class AddTextOfColumnThreeToCard < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :text_of_column_three, :text
  end
end

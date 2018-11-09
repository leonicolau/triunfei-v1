class AddDescriptionPromo < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :description_promo, :text
  end
end

class AddAnuityDescriptionToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :anuity_description, :string
  end
end

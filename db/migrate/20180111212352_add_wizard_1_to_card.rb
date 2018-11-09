class AddWizard1ToCard < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :wizard_1, :string
  end
end

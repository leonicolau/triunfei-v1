class AddWizard2ToCard < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :wizard_2, :string
  end
end

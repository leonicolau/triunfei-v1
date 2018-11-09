class AddWizard3ToCard < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :wizard_3, :string
  end
end

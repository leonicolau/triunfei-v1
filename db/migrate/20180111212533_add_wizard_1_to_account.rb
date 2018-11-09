class AddWizard1ToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :wizard_1, :string
  end
end

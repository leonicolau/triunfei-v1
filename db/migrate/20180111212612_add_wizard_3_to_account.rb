class AddWizard3ToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :wizard_3, :string
  end
end

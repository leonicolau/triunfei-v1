class AddWizard2ToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :wizard_2, :string
  end
end

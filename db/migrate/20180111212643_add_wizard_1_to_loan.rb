class AddWizard1ToLoan < ActiveRecord::Migration[5.1]
  def change
    add_column :loans, :wizard_1, :string
  end
end

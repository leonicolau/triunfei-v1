class AddWizard3ToLoan < ActiveRecord::Migration[5.1]
  def change
    add_column :loans, :wizard_3, :string
  end
end

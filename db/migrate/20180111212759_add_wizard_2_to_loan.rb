class AddWizard2ToLoan < ActiveRecord::Migration[5.1]
  def change
    add_column :loans, :wizard_2, :string
  end
end

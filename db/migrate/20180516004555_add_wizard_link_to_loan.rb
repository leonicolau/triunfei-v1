class AddWizardLinkToLoan < ActiveRecord::Migration[5.1]
  def change
    add_column :loans, :wizard_link, :string
  end
end

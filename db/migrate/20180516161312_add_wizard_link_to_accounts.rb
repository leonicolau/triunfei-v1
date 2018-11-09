class AddWizardLinkToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :wizard_link, :string
  end
end

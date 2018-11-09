class AddShowAtWizardToBanks < ActiveRecord::Migration[5.0]
  def change
    add_column :banks, :show_at_wizard, :boolean, default: false
  end
end

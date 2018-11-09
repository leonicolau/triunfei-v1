class AddDefaultValueToWizardFields < ActiveRecord::Migration[5.0]
  def change
    add_column :wizard_fields, :default_value, :string
  end
end

class AddDropdownOptionsToWizardField < ActiveRecord::Migration[5.0]
  def change
    add_column :wizard_fields, :dropdown_options, :string
  end
end

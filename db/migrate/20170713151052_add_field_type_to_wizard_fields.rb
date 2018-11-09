class AddFieldTypeToWizardFields < ActiveRecord::Migration[5.0]
  def change
    add_column :wizard_fields, :field_type, :integer
  end
end

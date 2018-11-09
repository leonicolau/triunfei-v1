class AddSearchTypeAndAllowNilToWizardFields < ActiveRecord::Migration[5.0]
  def change
    add_column :wizard_fields, :search_type, :integer
    add_column :wizard_fields, :allow_nil, :boolean
  end
end

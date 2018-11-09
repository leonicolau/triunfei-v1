class AddParentCssClassToWizardFields < ActiveRecord::Migration[5.0]
  def change
    add_column :wizard_fields, :parent_css_class, :string
  end
end

class RemoveParentCssClassFromWizardFields < ActiveRecord::Migration[5.0]
  def change
    remove_column :wizard_fields, :parent_css_class
  end
end

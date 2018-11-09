class AddStepToWizardField < ActiveRecord::Migration[5.0]
  def change
    add_column :wizard_fields, :step, :integer
  end
end

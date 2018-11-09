class AddMinValueAndMaxValueAndIntervalToWizardField < ActiveRecord::Migration[5.1]
  def change
    add_column :wizard_fields, :min_value, :integer, default: 0
    add_column :wizard_fields, :max_value, :integer, default: 10000
    add_column :wizard_fields, :interval, :integer, default: 1000
  end
end

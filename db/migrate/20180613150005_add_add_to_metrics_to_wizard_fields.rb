class AddAddToMetricsToWizardFields < ActiveRecord::Migration[5.1]
  def change
    add_column :wizard_fields, :add_to_metrics, :boolean, default: false
  end
end

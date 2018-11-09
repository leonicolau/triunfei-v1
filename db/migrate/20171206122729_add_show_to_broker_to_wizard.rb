class AddShowToBrokerToWizard < ActiveRecord::Migration[5.1]
  def change
    add_column :wizards, :show_to_broker, :boolean, default: false
  end
end

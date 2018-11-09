class AddRedirectToFirstResultToWizards < ActiveRecord::Migration[5.0]
  def change
    add_column :wizards, :redirect_to_first_result, :boolean, default: false
  end
end

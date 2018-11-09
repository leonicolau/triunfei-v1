class RemovePageFromWizards < ActiveRecord::Migration[5.0]
  def change
    remove_column :wizard_fields, :page
  end
end

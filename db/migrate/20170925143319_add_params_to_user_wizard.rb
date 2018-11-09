class AddParamsToUserWizard < ActiveRecord::Migration[5.0]
  def change
    add_column :user_wizards, :params, :text
  end
end

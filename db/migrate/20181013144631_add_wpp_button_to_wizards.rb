class AddWppButtonToWizards < ActiveRecord::Migration[5.2]
  def change
    add_column :wizards, :wpp_button, :boolean
  end
end

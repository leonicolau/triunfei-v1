class AddWelcomeMessageToWizards < ActiveRecord::Migration[5.2]
  def change
    add_column :wizards, :welcome_message, :text
  end
end

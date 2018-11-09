class AddDisplayThankYouPageToWizard < ActiveRecord::Migration[5.0]
  def change
    add_column :wizards, :display_thank_you_page, :boolean, default: false
  end
end

class AddAdminUserToUserWizard < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_wizards, :admin_user, foreign_key: true
  end
end

class AddAdminProfileToAdminUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :admin_users, :admin_profile, foreign_key: true
  end
end

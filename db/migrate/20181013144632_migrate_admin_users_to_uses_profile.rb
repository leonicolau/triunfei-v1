class MigrateAdminUsersToUsesProfile < ActiveRecord::Migration[5.1]
  def change
    admin_profile = AdminProfile.create!(name: 'Admin')
    broker_profile = AdminProfile.create!(name: 'Broker')
    lp_editor_profile = AdminProfile.create!(name: 'LP_Editor')

    AdminUser.update_all(admin_profile_id: admin_profile.id)
  end
end

class CreateAdminUsersTags < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_users_tags do |t|
      t.references :admin_user, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end

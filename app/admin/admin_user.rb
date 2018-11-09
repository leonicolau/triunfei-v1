ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :admin_profile_id, :tag_ids

  index do
    selectable_column
    id_column
    column :email
    column :admin_profile
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :admin_profile
      f.input :tags
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
    end
    f.actions
  end

end

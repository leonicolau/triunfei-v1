ActiveAdmin.register User do
  actions :all, except: [:new, :edit, :destroy]
  
  filter :email
  
  index do
    id_column
    column :email
  end

end

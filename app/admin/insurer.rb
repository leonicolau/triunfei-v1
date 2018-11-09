ActiveAdmin.register Insurer do
  permit_params :name, :photo 
  filter :name
  
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
  index do
    column :id
    column :name
    actions
  end

  form do |f|
    f.inputs 'Insurer details' do
      f.input :name
      f.input :photo
    end
    f.actions
  end

end

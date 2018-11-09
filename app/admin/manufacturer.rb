ActiveAdmin.register Manufacturer do
  permit_params :name

  filter :name
  
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :name
    actions
  end
  
  form do |f|
    f.inputs 'Manufacturer details' do
      f.input :name
    end
    f.actions
  end

end

ActiveAdmin.register Flag do
  permit_params :name, :photo, :card_description

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
    f.inputs 'Flag details' do
      f.input :name
      f.input :photo
    end
    f.actions
  end

end

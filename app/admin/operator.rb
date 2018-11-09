ActiveAdmin.register Operator do
  permit_params :name, :photo, :postback_url

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
    f.inputs 'Operator details' do
      f.input :name
      f.input :postback_url
      f.input :photo
    end
    f.actions
  end

end

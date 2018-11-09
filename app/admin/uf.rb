ActiveAdmin.register Uf do
  permit_params :name, :choose_product
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
    f.inputs 'Uf details' do
      f.input :name
      f.input :choose_product
    end
    f.actions
  end

end

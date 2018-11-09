ActiveAdmin.register City do
  permit_params :name, :uf_id
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
      f.input :uf, as: :select, collection: Uf.all
    end
    f.actions
  end

   show do |city|
    attributes_table do
     row :name
     row :uf
   end
  end
end

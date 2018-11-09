ActiveAdmin.register ProductTip do
  permit_params :title, :description, :text, :product, :active

  filter :title
  filter :product, as: :select, collection: proc { ProductTip.products.keys }

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :title
    actions
  end

  form do |f|
    f.inputs 'ProductTip details' do
      f.input :title
      f.input :description
      f.input :text
      f.input :product
      f.input :active, as: :boolean
    end
    f.actions
  end

end

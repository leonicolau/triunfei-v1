ActiveAdmin.register Coupon do
  permit_params :store_id, :name, :description, :discount_percentage, :coupon_code, :term, :rule, :link

  filter :store_id, as: :select, collection: proc { Store.all }

  filter :name

  controller do

    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :name
    column :store
    actions
  end

  form do |f|
    f.inputs 'Coupon form' do
      f.input :name
      f.input :description
      f.input :store_id, as: :select, collection: Store.all
      f.input :discount_percentage
      f.input :coupon_code
      f.input :term
      f.input :rule
      f.input :link
    end
    f.actions
  end
end

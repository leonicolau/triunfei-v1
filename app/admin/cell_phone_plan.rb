ActiveAdmin.register CellPhonePlan do
  permit_params :operator_id, :name, :plan_type, :description, :description_brand, :gb, :minutes, :price, :string, :order, :photo, :link, :wizard_1, :wizard_2, :wizard_3, :highlighted

  controller do

    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :photo do |cell_phone_plan|
      image_tag(cell_phone_plan.photo.url(:thumb), style: 'width: 40px')
    end
    column :name
    column :operator
    column :order
    actions
  end

  form do |f|
    f.inputs 'CellPhonePlan form' do
      f.input :name
      f.input :description
      f.input :operator, as: :select, collection: Operator.all
      f.input :plan_type
      f.input :description_brand
      f.input :minutes
      f.input :link
      f.input :gb
      f.input :order
      f.input :price
      f.input :wizard_1
      f.input :wizard_2
      f.input :wizard_3
      f.input :max_daily_redirect
      f.input :photo, as: :file, hint: image_tag(f.object.photo.url(:thumb))
      f.input :highlighted, as: :boolean
    end
    f.actions
  end

  show do |cell_phone_plan|
    attributes_table do
      row :name
      row :description
      row :operator
      row :plan_type
      row :minutes
      row :description_brand
      row :link
      row :gb
      row :price
      row :wizard_1
      row :wizard_2
      row :wizard_3
      row :order
      row :highlighted
      row :photo do
        image_tag(cell_phone_plan.photo.url)
      end
    end
  end
end

ActiveAdmin.register Consortium do
  permit_params :insurer_id, :name, :insurance_type_id, :benefits, :photo, :link, :value, :payment_term, :monthly_installment, :highlighted
  filter :insurance_type_id, as: :select, collection: proc { InsuranceType.all }

  controller do
     def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :photo do |consortium|
      image_tag(consortium.photo.url(:thumb), style: 'width: 40px')
    end
    column :name
    column :insurance_type
    column :insurer
    column :value
    column :payment_term
    column :monthly_installment
    actions
  end

  form do |f|
    f.inputs 'Consortium form' do
      f.input :name
      f.input :benefits
      f.input :insurer, as: :select, collection: Insurer.all
      f.input :insurance_type_id, as: :select, collection: InsuranceType.all
      f.input :value
      f.input :payment_term
      f.input :monthly_installment
      f.input :link
      f.input :highlighted, as: :boolean
      f.input :photo, as: :file, hint: image_tag(f.object.photo.url(:thumb))
    end
    f.actions
  end

  show do |consortium|
    attributes_table do
      row :name
      row :benefits
      row :insurer
      row :link
      row :insurance_type
      row :value
      row :monthly_installment
      row :payment_term
      row :highlighted
      row :photo do
        image_tag(consortium.photo.url)
      end
    end
  end
end

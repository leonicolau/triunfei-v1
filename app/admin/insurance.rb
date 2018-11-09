ActiveAdmin.register Insurance do
  permit_params :insurer_id, :name, :insurance_type_id, :benefits, :photo, :link, :highlighted
  filter :insurance_type_id, as: :select, collection: proc { InsuranceType.all }
  controller do

    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :photo do |insurance|
      image_tag(insurance.photo.url(:thumb), style: 'width: 40px')
    end
    column :name
    column :insurance_type
    column :insurer
    actions
  end

  form do |f|
    f.inputs 'Insurance form' do
      f.input :name
      f.input :benefits
      f.input :order
      f.input :insurer, as: :select, collection: Insurer.all
      f.input :link
      f.input :insurance_type, as: :select, collection: InsuranceType.all
      f.input :photo, as: :file, hint: image_tag(f.object.photo.url(:thumb))
      f.input :highlighted, as: :boolean
    end
    f.actions
  end

  show do |insurance|
    attributes_table do
      row :name
      row :benefits
      row :insurer
      row :link
      row :insurance_type
      row :photo do
        image_tag(insurance.photo.url)
      end
      row :highlighted
    end
  end
end

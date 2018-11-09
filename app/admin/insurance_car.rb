ActiveAdmin.register InsuranceCar do
  permit_params :insurer_id, :name, :insurance_type_id, :benefits, :photo, :link, :manufacturer_id, :highlighted
  filter :insurance_type_id, as: :select, collection: proc { InsuranceType.all }
  controller do

    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :photo do |insurance_car|
      image_tag(insurance_car.photo.url(:thumb), style: 'width: 40px')
    end
    column :name
    column :insurance_type
    column :insurer
    column :manufacturer
    actions
  end

  form do |f|
    f.inputs 'InsuranceCar form' do
      f.input :name
      f.input :benefits
      f.input :insurer, as: :select, collection: Insurer.all
      f.input :manufacturer_id, as: :select, collection: Manufacturer.all
      f.input :link
      f.input :insurance_type_id, as: :select, collection: InsuranceType.all
      f.input :highlighted, as: :boolean
      f.input :photo, as: :file, hint: image_tag(f.object.photo.url(:thumb))
    end
    f.actions
  end

  show do |insurance_car|
    attributes_table do
      row :name
      row :benefits
      row :insurer
      row :link
      row :insurance_type
      row :manufacturer
      row :highlighted
      row :photo do
        image_tag(insurance_car.photo.url)
      end
    end
  end
end

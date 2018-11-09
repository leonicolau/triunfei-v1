ActiveAdmin.register InsuranceTravel do
  permit_params :insurer_id, :name, :insurance_type_id, :benefits, :photo, :link, :country_destiny_id, :highlighted
  filter :insurance_type_id, as: :select, collection: proc { InsuranceType.all }
  controller do

    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :photo do |insurance_travel|
      image_tag(insurance_travel.photo.url(:thumb), style: 'width: 40px')
    end
    column :name
    column :insurance_type
    column :insurer
    column :continent
    column :city
    column :country_destiny
    actions
  end

  form do |f|
    f.inputs 'InsuranceTravel form' do
      f.input :name
      f.input :benefits
      f.input :insurer, as: :select, collection: Insurer.all
      f.input :link
      f.input :insurance_type_id, as: :select, collection: InsuranceType.all
      f.input :country_destiny_id, as: :select, collection: CountryDestiny.all
      f.input :highlighted, as: :boolean
      f.input :photo, as: :file, hint: image_tag(f.object.photo.url(:thumb))
    end
    f.actions
  end

  show do |insurance_travel|
    attributes_table do
      row :name
      row :benefits
      row :insurer
      row :link
      row :insurance_type
      row :country_destiny
      row :highlighted
      row :photo do
        image_tag(insurance_travel.photo.url)
      end
    end
  end
end

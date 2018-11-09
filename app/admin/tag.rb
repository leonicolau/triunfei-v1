ActiveAdmin.register Tag do
  permit_params :name

  filter :name

  index do
    column :name
    actions
  end

  form do |f|
    f.inputs 'Tag details' do
      f.input :name
    end
    f.actions
  end

end

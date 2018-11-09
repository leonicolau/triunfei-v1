ActiveAdmin.register ProductRedirect do
  permit_params :product_id, :product_type

  filter :name

  index do
    column :id
    actions
  end

  form do |f|
    f.inputs 'ProductRedirect details' do
      f.input :product_id
      f.input :product_type
    end
    f.actions
  end

end

ActiveAdmin.register MetaTag do
  permit_params :name, :value, :page, :property, :raw_text

  filter :name
  filter :value
  filter :property

  index do
    column :name
    column :page
    column :property
    column :raw_text
    actions
  end

  form do |f|
    f.inputs 'Meta tag details' do
      f.input :name
      f.input :value
      f.input :page
      f.input :property
      f.input :raw_text
      f.actions
    end
  end

end

ActiveAdmin.register AutomatedLandingPage do
  permit_params :title, :description, :landing_page_type

  filter :title

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
    f.inputs 'AutomatedlandingPage details' do
      f.input :title
      f.input :description
      f.input :landing_page_type
    end
    f.actions
  end

end

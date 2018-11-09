ActiveAdmin.register LandingPage do
  permit_params :name, :title, :text1, :text2, :page_type, :postback_url, :html, :show_landing, :order, :affiliate_link, :style, :photo

  filter :name

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :name
    column :slug
    actions
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :title
      f.input :order
      f.input :postback_url
      f.input :affiliate_link
      f.input :page_type
      f.input :text1
      f.input :text2
      f.input :style
      f.input :html
      f.input :photo, as: :file, hint: image_tag(f.object.photo.url(:thumb))
      f.input :show_landing, as: :boolean
    end
    f.actions
  end

end

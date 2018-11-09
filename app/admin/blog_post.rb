ActiveAdmin.register BlogPost do
  permit_params :visible, :position, :post_type

  filter :visible
  
  collection_action :import, method: :get do
    BlogPost.import

    redirect_back(fallback_location: '/admin')
  end

  config.clear_action_items!
  action_item :import, only: :index do
    link_to 'Import', import_admin_blog_posts_path
  end

  index do
    column :position
    column :original_post_id
    column :published_at
    column :visible
    column :title
    column :post_type

    actions
  end

  form do |f|
    f.inputs 'Blog post details' do
      f.input :title, input_html: { disabled: true }
      f.input :position
      f.input :visible
      f.input :post_type
    end
    f.actions
  end

  show do |post|
    attributes_table do
      row :position
      row :original_post_id
      row :url
      row :published_at
      row :visible
      row :title
      row :post_type
      row :summary
      row :content
    end
  end
end
class AddShowBlogToCountry < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :show_blog, :boolean, default: false
  end
end

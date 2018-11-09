class AddPostTypeToBlogPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :blog_posts, :post_type, :integer
  end
end

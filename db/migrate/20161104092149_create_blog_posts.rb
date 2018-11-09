class CreateBlogPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :blog_posts do |t|
      t.integer :original_post_id
      t.string :title
      t.string :url
      t.boolean :visible, default: false
      t.datetime :published_at
      t.string :summary
      t.string :content
      t.integer :position
    end
  end
end

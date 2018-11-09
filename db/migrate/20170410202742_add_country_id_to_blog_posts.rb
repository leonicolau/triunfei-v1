class AddCountryIdToBlogPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :blog_posts, :country, foreign_key: true
  end
end

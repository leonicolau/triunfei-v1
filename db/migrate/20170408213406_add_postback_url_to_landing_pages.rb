class AddPostbackUrlToLandingPages < ActiveRecord::Migration[5.0]
  def change
    add_column :landing_pages, :postback_url, :string
  end
end

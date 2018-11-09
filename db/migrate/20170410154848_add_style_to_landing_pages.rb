class AddStyleToLandingPages < ActiveRecord::Migration[5.0]
  def change
    add_column :landing_pages, :style, :text
  end
end

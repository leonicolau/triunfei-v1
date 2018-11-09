class AddHtmlToLandingPages < ActiveRecord::Migration[5.0]
  def change
    add_column :landing_pages, :html, :text
  end
end

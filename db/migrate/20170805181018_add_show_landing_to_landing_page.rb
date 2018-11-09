class AddShowLandingToLandingPage < ActiveRecord::Migration[5.0]
  def change
    add_column :landing_pages, :show_landing, :boolean
  end
end

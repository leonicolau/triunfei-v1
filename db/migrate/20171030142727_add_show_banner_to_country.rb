class AddShowBannerToCountry < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :show_banner, :boolean
  end
end

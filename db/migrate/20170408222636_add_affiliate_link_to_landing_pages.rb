class AddAffiliateLinkToLandingPages < ActiveRecord::Migration[5.0]
  def change
    add_column :landing_pages, :affiliate_link, :string
  end
end

class AddCountryToLandingPages < ActiveRecord::Migration[5.0]
  def change
    add_reference :landing_pages, :country, foreign_key: true
  end
end

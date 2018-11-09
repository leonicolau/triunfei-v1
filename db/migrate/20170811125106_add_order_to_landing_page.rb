class AddOrderToLandingPage < ActiveRecord::Migration[5.0]
  def change
    add_column :landing_pages, :order, :integer
  end
end

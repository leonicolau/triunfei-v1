class AddLandingUrlToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :landing_url, :string
  end
end

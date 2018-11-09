class AddTimestampsToProductRedirects < ActiveRecord::Migration[5.1]
  def change
    change_table :product_redirects do |t|
      t.timestamps
    end
  end
end

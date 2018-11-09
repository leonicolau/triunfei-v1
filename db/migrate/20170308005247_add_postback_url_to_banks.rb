class AddPostbackUrlToBanks < ActiveRecord::Migration[5.0]
  def change
    add_column :banks, :postback_url, :string
  end
end

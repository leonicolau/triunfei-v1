class AddPostbackUrlToOperators < ActiveRecord::Migration[5.0]
  def change
    add_column :operators, :postback_url, :string
  end
end

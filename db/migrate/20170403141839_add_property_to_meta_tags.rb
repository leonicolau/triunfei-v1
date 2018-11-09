class AddPropertyToMetaTags < ActiveRecord::Migration[5.0]
  def change
    add_column :meta_tags, :property, :string
  end
end

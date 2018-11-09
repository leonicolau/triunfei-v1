class AddRawTextToMetaTag < ActiveRecord::Migration[5.0]
  def change
    add_column :meta_tags, :raw_text, :string
  end
end

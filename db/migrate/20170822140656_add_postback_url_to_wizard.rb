class AddPostbackUrlToWizard < ActiveRecord::Migration[5.0]
  def change
    add_column :wizards, :postback_url, :string
  end
end

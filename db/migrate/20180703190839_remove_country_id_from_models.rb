class RemoveCountryIdFromModels < ActiveRecord::Migration[5.2]
  def change
    remove_column :accounts, :country_id
    remove_column :banks, :country_id
    remove_column :blog_posts, :country_id
    remove_column :cards, :country_id
    remove_column :cell_phone_plans, :country_id
    remove_column :cities, :country_id
    remove_column :consortia, :country_id
    remove_column :country_destinies, :country_id
    remove_column :flags, :country_id
    remove_column :insurances, :country_id
    remove_column :insurance_cars, :country_id
    remove_column :insurance_travels, :country_id
    remove_column :insurance_types, :country_id
    remove_column :insurers, :country_id
    remove_column :landing_pages, :country_id
    remove_column :loans, :country_id
    remove_column :manufacturers, :country_id
    remove_column :meta_tags, :country_id
    remove_column :operators, :country_id
    remove_column :product_tips, :country_id
    remove_column :ufs, :country_id
    remove_column :wizards, :country_id
  end
end

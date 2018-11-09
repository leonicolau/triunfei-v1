class RenamePostbackUrlInBanks < ActiveRecord::Migration[5.0]
  def change
    rename_column :banks, :postback_url, :card_postback_url
  end
end

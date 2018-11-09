class AddAffiliateLinkToBanks < ActiveRecord::Migration[5.0]
  def change
    add_column :banks, :affiliate_link, :string
  end
end

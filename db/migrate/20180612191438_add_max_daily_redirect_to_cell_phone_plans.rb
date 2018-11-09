class AddMaxDailyRedirectToCellPhonePlans < ActiveRecord::Migration[5.1]
  def change
    add_column :cell_phone_plans, :max_daily_redirect, :integer
  end
end

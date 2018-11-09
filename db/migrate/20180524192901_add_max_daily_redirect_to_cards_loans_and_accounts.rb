class AddMaxDailyRedirectToCardsLoansAndAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :max_daily_redirect, :integer
    add_column :accounts, :max_daily_redirect, :integer
    add_column :loans, :max_daily_redirect, :integer
  end
end

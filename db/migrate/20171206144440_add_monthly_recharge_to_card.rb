class AddMonthlyRechargeToCard < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :monthly_recharge, :decimal
  end
end

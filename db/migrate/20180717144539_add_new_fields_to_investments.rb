class AddNewFieldsToInvestments < ActiveRecord::Migration[5.2]
  def change
    add_column :investments, :investment_term, :integer
    add_column :investments, :gross_profitability, :decimal, precision: 8, scale: 2
    add_column :investments, :expected_return, :decimal, precision: 8, scale: 2
    add_column :investments, :profitability, :decimal, precision: 8, scale: 2
    add_column :investments, :duration, :integer
    add_column :investments, :type_of_profitability, :integer
    add_column :investments, :cdi_rate, :decimal, precision: 8, scale: 2
    add_column :investments, :ipca_rate, :decimal, precision: 8, scale: 2
    add_column :investments, :order, :integer, default: 0

    rename_column :investments, :investment_type, :fixed_remuneration
  end
end

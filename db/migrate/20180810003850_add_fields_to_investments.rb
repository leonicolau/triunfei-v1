class AddFieldsToInvestments < ActiveRecord::Migration[5.2]
  def change
    add_column :investments, :bank_id, :integer
    add_column :investments, :indexer, :string
    add_column :investments, :minimum_investment_value, :decimal, precision: 8, scale: 2
    add_column :investments, :fgc_guarantee, :boolean, default: false
    add_column :investments, :yearly_profitability_value, :decimal, precision: 8, scale: 2
    add_column :investments, :net_profitability_value, :decimal, precision: 8, scale: 2
    add_column :investments, :product_category, :string
    add_column :investments, :savings_profitability_value, :decimal, precision: 8, scale: 2
    add_column :investments, :gross_return_expectation_value, :decimal, precision: 8, scale: 2
    add_column :investments, :net_return_expectation_value, :decimal, precision: 8, scale: 2
    add_column :investments, :year_return_expectation_value, :decimal, precision: 8, scale: 2
    add_column :investments, :gain_over_savings, :decimal, precision: 8, scale: 2
    add_column :investments, :profitability_category_name, :string
    add_column :investments, :bank_score, :integer
  end
end

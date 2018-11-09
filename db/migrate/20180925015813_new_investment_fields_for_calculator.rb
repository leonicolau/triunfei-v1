class NewInvestmentFieldsForCalculator < ActiveRecord::Migration[5.2]
  def change
    add_column :investments, :cdi_return, :decimal
    add_column :investments, :gross_return, :decimal
  end
end

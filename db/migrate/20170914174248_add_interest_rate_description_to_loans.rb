class AddInterestRateDescriptionToLoans < ActiveRecord::Migration[5.0]
  def change
    add_column :loans, :interest_rate_description, :string
  end
end

class AddActiveToLoans < ActiveRecord::Migration[5.0]
  def change
    add_column :loans, :active, :boolean, default: true
  end
end

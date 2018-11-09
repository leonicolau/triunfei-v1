class AddCompanyNameToCard < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :company_name, :string
  end
end


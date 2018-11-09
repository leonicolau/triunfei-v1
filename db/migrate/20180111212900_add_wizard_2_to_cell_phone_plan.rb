class AddWizard2ToCellPhonePlan < ActiveRecord::Migration[5.1]
  def change
    add_column :cell_phone_plans, :wizard_2, :string
  end
end

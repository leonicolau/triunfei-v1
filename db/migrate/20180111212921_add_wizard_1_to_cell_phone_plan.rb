class AddWizard1ToCellPhonePlan < ActiveRecord::Migration[5.1]
  def change
    add_column :cell_phone_plans, :wizard_1, :string
  end
end

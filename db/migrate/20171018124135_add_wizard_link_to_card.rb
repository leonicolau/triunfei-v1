class AddWizardLinkToCard < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :wizard_link, :string
  end
end

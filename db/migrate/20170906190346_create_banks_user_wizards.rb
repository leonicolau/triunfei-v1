class CreateBanksUserWizards < ActiveRecord::Migration[5.0]
  def change
    create_table :banks_user_wizards do |t|
      t.references :bank, foreign_key: true
      t.references :user_wizard, foreign_key: true
    end
  end
end

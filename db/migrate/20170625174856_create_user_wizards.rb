class CreateUserWizards < ActiveRecord::Migration[5.0]
  def change
    create_table :user_wizards do |t|
      t.references :user, foreign_key: true
      t.references :wizard, foreign_key: true
      t.text :answers, default: '{}'

      t.timestamps
    end
  end
end

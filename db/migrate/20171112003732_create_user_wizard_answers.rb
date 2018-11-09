class CreateUserWizardAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :user_wizard_answers do |t|
      t.string :value
      t.references :user_wizard, foreign_key: true
      t.references :wizard_field, foreign_key: true

      t.timestamps
    end
  end
end

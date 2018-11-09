class MigrateUserWizardAnswers < ActiveRecord::Migration[5.1]
  def change
    UserWizard.find_each do |user_wizard|
      next unless user_wizard.answers.is_a?(Hash)
      user_wizard.answers.each do |k, v|
        wizard_field = user_wizard&.wizard&.wizard_fields&.find_by(name: k)
        next if wizard_field.blank? || v.blank?
        user_wizard.user_wizard_answers.create!(wizard_field: wizard_field, value: v)
      end
    end
  end
end

class AddThankYouMessageToWizard < ActiveRecord::Migration[5.1]
  def change
    add_column :wizards, :thank_you_message, :string, default: 'Obrigado! Entraremos em contato logo mais!'
  end
end

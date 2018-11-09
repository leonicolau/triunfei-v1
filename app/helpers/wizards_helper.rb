# frozen_string_literal: true

module WizardsHelper
  def fields_for_step(wizard, step)
    wizard.wizard_fields.where(step: step).where.not(field_type: :hidden)
  end

  def correct_welcome_message
    if set_device_type == 'smartphone'
      t('wizard.show.mobile_message', value: set_device_name)
    else
      t('wizard.show.hello_message_html')
    end
  end
end

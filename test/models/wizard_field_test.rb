require 'test_helper'

class WizardFieldTest < ActiveSupport::TestCase
  test '.filter filters by wizard' do
    assert_equal wizards(:santander).wizard_fields.order(:id), WizardField.filter(wizard_id: wizards(:santander).id).order(:id).to_a
  end

  test '.filter filters by step' do
    WizardField.where.not(id: wizard_fields(:number).id).update_all(step: 1)
    assert_equal [wizard_fields(:number)], WizardField.filter(step: 3).to_a
  end

  test '.filter allows to exclude hidden fields' do
    WizardField.where.not(id: wizard_fields(:number).id).update_all(field_type: :hidden)
    assert_equal [wizard_fields(:number)], WizardField.filter(visible: true).to_a
  end

  test '#wizard_field_type returns correct wizard type for vuejs component' do
    assert_equal 'wizard-text', WizardField.new(field_type: :text).wizard_field_type
    assert_equal 'wizard-slider', WizardField.new(field_type: :slider).wizard_field_type
    assert_equal 'wizard-bank-selector', WizardField.new(field_type: :bank_selector).wizard_field_type
    assert_equal 'wizard-dropdown', WizardField.new(field_type: :dropdown).wizard_field_type
    assert_equal 'wizard-hidden', WizardField.new(field_type: :hidden).wizard_field_type
  end
end

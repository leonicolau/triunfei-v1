require 'test_helper'

class UserWizardPolicyTest < ActiveSupport::TestCase
  test '#index? returns true' do
    assert UserWizardPolicy.new(admin_users(:admin), UserWizard).index?
  end

  test '#show? returns true if user is admin' do
    assert UserWizardPolicy.new(admin_users(:admin), UserWizard).show?
  end

  test '#show? returns true if user is broker and got the lead' do
    assert UserWizardPolicy.new(admin_users(:broker), UserWizard.new(admin_user_id: admin_users(:broker).id)).show?
  end

  test '#show? returns false if user is broker and do not got the lead' do
    refute UserWizardPolicy.new(admin_users(:broker), UserWizard.new).show?
  end

  test '#get_lead? returns false if record already have an admin user associated' do
    refute UserWizardPolicy.new(admin_users(:broker), UserWizard.new(admin_user_id: 1)).get_lead?
  end

  test '#get_lead? returns false if record wizard show to broker is false' do
    refute UserWizardPolicy.new(admin_users(:broker), UserWizard.new(wizard: Wizard.new(show_to_broker: false))).get_lead?
  end

  test '#get_lead? returns true if record wizard show to broker is true and has not admin user associated' do
    assert UserWizardPolicy.new(admin_users(:broker), UserWizard.new(wizard: Wizard.new(show_to_broker: true))).get_lead?
  end
end

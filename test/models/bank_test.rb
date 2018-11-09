require 'test_helper'

class BankTest < ActiveSupport::TestCase

  test "associations" do
    assert_equal banks(:itau).cards, [cards(:visa_credit)]
  end

  test 'validations' do
    bank = Bank.new
    bank.save

    assert_equal bank.errors[:name], ['não pode ficar em branco']
  end

  test '#for_wizard returns banks flagged as show_at_wizard' do
    assert_equal [banks(:itau)], Bank.for_wizard.to_a
  end

  test '#after_save updates updated_at for card' do
    last_updated_at = cards(:visa_credit).updated_at
    cards(:visa_credit).bank.update!(name: 'A new cool name')

    assert cards(:visa_credit).reload.updated_at > last_updated_at
  end

  test '#after_save updates updated_at for loans' do
    last_updated_at = loans(:itau_emprestimo).updated_at
    loans(:itau_emprestimo).bank.update!(name: 'A new cool name')

    assert loans(:itau_emprestimo).reload.updated_at > last_updated_at
  end

  test '#after_save updates updated_at for accounts' do
    last_updated_at = accounts(:conta_itau).updated_at
    accounts(:conta_itau).bank.update!(name: 'A new cool name')

    assert accounts(:conta_itau).reload.updated_at > last_updated_at
  end
end

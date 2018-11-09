# frozen_string_literal: true
require 'test_helper'

class AccountsHelperTest < ActionView::TestCase

    test 'taxes_account' do
    assert_equal t('anuity_free'), taxes_account(Account.new(taxes: nil)) 
    assert_equal number_to_currency(accounts(:conta_itau).taxes), taxes_account(accounts(:conta_itau))
    
end
 
    test 'minimun_deposit' do
    assert_equal t('free_unit'), minimun_deposit(Account.new(minimum_deposit: nil)) 
    assert_equal number_to_currency(accounts(:conta_bradesco).minimum_deposit), minimun_deposit(accounts(:conta_bradesco))
    
    end
end

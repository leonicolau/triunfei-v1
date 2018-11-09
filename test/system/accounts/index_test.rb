# frozen_string_literal: true
require "application_system_test_case"

class AccountsIndexTest < ApplicationSystemTestCase

  include ActionView::Helpers::NumberHelper

  test 'user sees taxes formatted' do
   visit accounts_url
   assert_text number_to_currency(accounts(:conta_itau).taxes)
  end
# TODO: check why fail random
#  test 'user can filter by bank' do
#    visit accounts_url
#    page.execute_script('window.scrollTo(0,500)')

#    check "bank-#{banks(:bradesco).id}"

#    assert_selector '.row.card', count: 1
#    assert_equal current_path, '/contas-corrente/filtro/bradesco'
#  end

#  test 'user can filter by no rent' do
#    visit accounts_url
#    assert_selector '.row.card', count: 2

#    choose('renda-minima_renda-minima-naoexigida')

#    assert_no_selector '.row.card'
#    assert_equal current_path, '/contas-corrente/filtro/renda-minima-naoexigida'
#  end


#  test 'user can filter by rent between 0 and 1500' do
#    visit accounts_url
#    assert_selector '.row.card', count: 2
#
#    choose('renda-minima_renda-minima-0-1500')
#
#    assert_selector '.row.card', count: 1
#    assert_equal current_path, '/contas-corrente/filtro/renda-minima-0-1500'
#
#  end

  test 'user can goes to info page through more info button' do
    Account.where.not(id: accounts(:conta_itau).id).delete_all
    visit accounts_url

    click_on "Saiba mais"
    assert "/contas-corrente/#{accounts(:conta_itau).slug}", current_path
  end

  test 'user sees bank filters that has accounts associated' do
    visit accounts_url

    assert_field("bank-#{banks(:bradesco).id}")
    assert_no_field("bank-#{banks(:banco_do_brasil).id}")
  end

  test 'user can order account by rent' do
    visit accounts_url

    click_button 'Ordenar'
    within '.desktop-sort' do
      click_link 'Renda mínima'
    end

    assert_equal '/contas-corrente/filtro/ordenado-por-renda-minima', current_path
  end

  test 'user can see correctly title ' do
    visit filter_accounts_url(path: '/filtro/original')

    assert page.body.include?("Conta Corrente Original: como solicitar, fazer, conseguir, tirar Conta Corrente Original online")
  end

  test 'user can see correctly subtitle' do
    visit filter_accounts_url(path: '/banco-do-brasil')

    assert_text('Compare e solicite contas correntes Banco Do Brasil que selecionamos pra você!')
  end

  test 'go to site should redirect to wizard_link' do
    visit filter_accounts_url(path: '/filtro/original')

    check "bank-#{banks(:original).id}"

    click_on 'Solicitar Conta'

    assert "/wizards/teste", current_path
  end

end

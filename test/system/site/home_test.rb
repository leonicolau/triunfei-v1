# frozen_string_literal: true
require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase

 test 'user can be redirected to cards path through card square' do
    visit root_path

    click_on "Cartão"
    assert cards_path, current_path
  end

 test 'user can be redirected to loans path through loan square' do
    visit root_path

    within(".red") do
      click_on('Empréstimos')
    end
    assert loans_path, current_path
  end

 test 'user can be redirected to accounts path through account square' do
    visit root_path

    within(".blue") do
      click_on('Contas Correntes')
    end
    assert accounts_path, current_path
  end

  test 'user can be redirected to cellphoneplans path through cellphoneplan square' do
    visit root_path

    within(".purple") do
      click_on('Plano celular')
    end
    assert cell_phone_plans_path, current_path
  end

  test 'user can not see whatsapp share button' do
    visit root_path

    assert_no_selector '.wpp_desktop'
  end

  test 'user can be redirected to investment path through investment square' do
    visit root_path

    click_on "Investimento"

    assert investments_path, current_path
  end

end

# frozen_string_literal: true
require "application_system_test_case"

class WizardsShowTest < ApplicationSystemTestCase
  test 'user sees wizard sign in page when is not logged in' do
    visit wizard_path(id: wizards(:santander).id)

    assert_text 'Bem vindo ao nosso assistente inteligente!'
  end

  test 'user sees wizard form' do
    login_as users(:leonardo)
    visit wizard_path(id: wizards(:santander).id)

    assert_selector '.form-control'
  end

  # TODO: check why test fail
  # test 'if the thank you message appears' do
  #  login_as users(:leonardo)
  #  visit wizard_path(id: wizards(:bradesco).id)
  #  fill_in 'banco', with: "itau"
  #  click_on 'Continuar'
  #  fill_in 'adress', with: "8th Street West"
  #  click_on 'Continuar'
  #  fill_in 'number', with: "91320-150"
  #  click_on 'Continuar'
  #  assert_text 'Obrigado'
  # end

  test 'user sees the questions in form' do
    login_as users(:leonardo)
    visit wizard_path(id: wizards(:santander).id)

    assert page.find('label')
  end

# TODO: check why random fail
=begin
  test 'user can see result page' do
    login_as users(:leonardo)
    visit wizard_path(id: wizards(:santander).id)

    fill_in 'name', with: "leonardo"
    click_on 'Continuar'
    fill_in 'birthdate', with: "27/11/1997"
    click_on 'Continuar'
    fill_in 'cep', with: "91320-150"
    click_on 'Continuar'
    assert_selector('.row.card', count: 3)
  end
=end

end

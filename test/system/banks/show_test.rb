# frozen_string_literal: true
require "application_system_test_case"

class BanksShowTest < ApplicationSystemTestCase
=begin
  test 'should filter card' do
    visit bank_path(:itau)
    assert page.has_css?('.row.card', count: 1)

    check "flag-#{flags(:master).id}"

    assert_equal '/bancos/itau/filtro/master', current_path

    assert_text 'Nenhum registro encontrado. Tente a busca com novos filtros.'
  end
=end
  test 'should display subheader for bank' do
    visit bank_path(:itau)

    within '.header-bank' do
      assert page.has_css?('.description', text: banks(:itau).card_description)
    end
  end

  test 'should order card' do
    visit bank_path(:itau)

    click_button 'Ordenar'
    click_link 'Anuidade'

    assert_equal '/bancos/itau/filtro/ordenado-por-anuidade', current_path
  end

  test 'should show flag filter that has cards associated' do
    visit bank_path(:itau)

    assert page.has_field?("flag-#{flags(:visa).id}")
    assert page.has_no_field?("flag-#{flags(:amex).id}")
  end
end

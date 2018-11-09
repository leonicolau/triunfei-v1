# frozen_string_literal: true
require "application_system_test_case"

class InsurancesIndexTest < ApplicationSystemTestCase
  include ActionView::Helpers::NumberHelper


  test 'user sees insurer filters that has insurance associated' do
    visit insurances_url

    assert_field("insurer-#{insurers(:santander).id}")
  end

  test 'user can filter insurance by insurer' do
    visit insurances_url

    check "insurer-#{insurers(:bradesco).id}"

    assert_selector '.card-wrap', match: :first
    assert_equal current_path, '/seguros/filtro/bradesco'
  end

  test 'user sees if link_more_info is going to the correct destination' do
    Insurance.where.not(id: insurances(:seguro_vida).id).delete_all
    visit insurances_url

    click_on "Saiba mais"
    assert "/seguro/seguro-vida", current_path
  end

  test 'user sees displayed benefits' do
    visit insurances_url

    check "insurer-#{insurers(:bradesco).id}"

    assert_text 'muitos beneficios'
  end

  test 'user can order insurances' do
    visit insurances_url

    click_button 'Ordenar'
    within '.desktop-sort' do
      click_link 'Benefícios'
    end

    assert_equal '/seguros/filtro/ordenado-por-beneficios', current_path
  end

end

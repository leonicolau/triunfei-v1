# frozen_string_literal: true
require "application_system_test_case"

class InvestmentsIndexTest < ApplicationSystemTestCase
  include ActionView::Helpers::NumberHelper


  test 'user sees broker filters that has investment associated' do
    visit investments_url

    assert_field("broker-#{brokers(:santander).id}")
  end

  test 'user can filter investment by broker' do
    visit investments_url

    check "broker-#{brokers(:xp).id}"

    assert_selector '.card-wrap', match: :first
    assert_equal current_path, '/investimentos/filtro/xp'
  end

  test 'user can filter investment by treasury direct' do
    visit investments_url

    page.check('TESOURO DIRETO')

    assert_selector '.card-wrap', match: :first
    assert_equal current_path, '/investimentos/filtro/tipo-tesouro-direto'
  end

  test 'user sees displayed benefits' do
    visit investments_url

    check "broker-#{brokers(:xp).id}"

    click_on "Saiba mais"

    assert_text 'o melhor investimento do brasil'
  end

  test 'user sees displayed cdi rate' do
    visit investments_url

    check "broker-#{brokers(:xp).id}"

    click_on "Saiba mais"

    assert_text 'Taxa CDI: 6,39%'
  end

  test 'user sees return of investment when investment is pre-set' do
    Investment.where.not(id: investments(:investimento_santander).id).delete_all

    visit investments_path

    assert_text 'R$ 11.261,35'
  end

  test 'user sees return of investment when investment is LCI' do
    Investment.where.not(id: investments(:investimento_xp).id).delete_all

    visit investments_path

    assert_text 'R$ 10.000,00'
  end

  test 'user sees return of investment when the amount is changed' do
    Investment.where.not(id: investments(:investimento_santander).id).delete_all

    visit "#{root_url}investimentos?amount=10000&time_value=700"

    assert_text 'R$ 11.261,35'
  end
end

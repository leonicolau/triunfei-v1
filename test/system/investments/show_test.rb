require "application_system_test_case"

class InvestmentsShowTest < ApplicationSystemTestCase

include ActionView::Helpers::NumberHelper

  test 'user sees broker' do
    visit investment_path(investments(:investimento_santander))
    assert_text 'Corretora: Santander'
  end

  test 'user sees cdi rate' do
    visit investment_path(investments(:investimento_santander))
    assert_text 'Taxa CDI: 6,39%'
  end

  test 'user sees duration' do
    visit investment_path(investments(:investimento_santander))
    assert_text 'Duração: 130 dias'
  end

  test 'user sees profitability' do
    visit investment_path(investments(:investimento_santander))
    assert_text 'Rentabilidade: 6.07%'
  end

  test 'user sees "CONFIRA" button' do
    visit investment_path(investments(:investimento_santander))
    click_on 'Conferir Corretora'
  end
end

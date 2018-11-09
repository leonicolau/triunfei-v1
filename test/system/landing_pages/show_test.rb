# frozen_string_literal: true
require "application_system_test_case"

class LandingPagesShowTest < ApplicationSystemTestCase

  test 'should render card page type' do
    visit "#{root_url}/#{landing_pages(:o_melhor_cartao_para_voce).slug}"

    click_on 'COMECE SUA BUSCA!'

    assert_equal wizard_path('assistente-financeiro'), current_path
  end

  test 'should render account page type' do
    visit "#{root_url}/#{landing_pages(:melhor_conta_para_voce).slug}"

    click_on 'COMECE SUA BUSCA!'

    assert_equal accounts_path, current_path
  end

  test 'should render loan page type' do
    visit "#{root_url}/#{landing_pages(:melhor_emprestimo_para_voce).slug}"

    click_on 'COMECE SUA BUSCA!'

    assert_equal wizard_path('assistente-emprestimo'), current_path
  end

  test 'user can not see whatsapp share button' do
    visit "#{root_url}/#{landing_pages(:melhor_emprestimo_para_voce).slug}"

    assert_no_selector '.wpp_desktop'
  end
end

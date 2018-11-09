require 'test_helper'

class InvestmentsControllerTest < ActionDispatch::IntegrationTest
  include ActionView::Helpers::NumberHelper

  test "#index renders correct title for investment" do
    get investments_url
    assert_response :success
    assert_select 'title', 'Investimentos : compare os melhores investimentos'
  end

  test "#index renders correct title for fixed remuneration" do
    get "#{investments_url}/filtro/tipo-tesouro-direto"
    assert_response :success
    assert_select 'title', 'Investimentos : compare os melhores investimentos  Tipo Tesouro Direto'
  end

  test "#index renders correct title for duration" do
    get "#{investments_url}/filtro/duracao-0-100"
    assert_response :success
    assert_select 'title', 'Investimentos : compare os melhores investimentos   com duração de 100 dias'
  end

  test "#index renders correct for investment" do
    get investments_url
    assert_response :success

    assert_select '.main-title-page', 'Compare e faça investimentos    que selecionamos pra você!'
  end

  test '#index renders correct title for xp broker' do
    get "#{investments_url}/filtro/xp"

    assert_response :success

    assert_select 'title', 'Investimentos Xp: compare os melhores investimentos Xp'
  end

  test '#index renders correct h1 for xp broker' do
    get "#{investments_url}/filtro/xp"
    assert_response :success

    assert_select '.main-title-page', 'Compare e faça investimentos Xp   que selecionamos pra você!'
  end

  test '#index renders correct h1 for fixed remuneration' do
    get "#{investments_url}/filtro/xp/tipo-tesouro-direto"
    assert_response :success

    assert_select '.main-title-page', 'Compare e faça investimentos Xp  Tipo Tesouro Direto que selecionamos pra você!'
  end

  test '#index renders correct h1 for tip' do
    get "#{investments_url}/filtro?tip=an-investment-tip"
    assert_response :success

    assert_select '.main-title-page', 'An investment tip'
  end

  test '#index renders correct title for tip' do
    get "#{investments_url}/filtro?tip=an-investment-tip"
    assert_response :success

    assert_select 'title', 'An investment tip'
  end

  test '#index display investments tips' do
    get investments_url
    assert_select '.tip-item', count: 1
    assert_match product_tips(:investment).title, response.body
  end

  test '#go_to_site redirects to investment link with cid params' do
    get go_to_site_investment_path(id: investments(:investimento_xp).slug), params: { cid: 'cid123' }

    assert_redirected_to 'http://test.com?cid=cid123'
  end

end

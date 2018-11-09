require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test "#index display correct title" do
    get accounts_url

    assert_response :success
    assert_select 'title', 'Conta Corrente : como solicitar, fazer, conseguir, tirar Conta Corrente  online'
    assert_select '.main-title-page', 'Compare e solicite contas correntes  que selecionamos pra você!'

    get "#{accounts_url}/filtro/itau"

    assert_select 'title', 'Conta Corrente Itau: como solicitar, fazer, conseguir, tirar Conta Corrente Itau online'
    assert_select '.main-title-page', 'Compare e solicite contas correntes Itau que selecionamos pra você!'
  end

  test '#index display ribbon partial when account has highlighted flag as true' do
    accounts(:conta_itau).update!(highlighted: true)
    get accounts_url
    assert_select "#account-#{accounts(:conta_itau).id} .ribbon-right"
    assert_select "#account-#{accounts(:conta_itau).id} .ribbon-left"
  end

  test '#index display accounts tips' do
    get accounts_url
    assert_select '.tip-item', count: 2
    assert_match product_tips(:account).title, response.body
  end

  test '#show display corrects tag name' do
    get account_url(accounts(:conta_itau))

    assert_response :success
    assert_select "meta[name=#{meta_tags(:account_description).name}]", 1
  end

  test '#index display more info bank modal' do
    get accounts_url
    assert_select 'div.more-info-bank'
  end

  test '#go_to_site redirects to account link when wizard_link is blank' do
    get go_to_site_account_path(id: accounts(:conta_itau).slug)

    assert_redirected_to accounts(:conta_itau).link
  end

  test '#go_to_site redirects to account wizard_link when wizard_link is present' do
    accounts(:conta_itau).update(wizard_link: 'www.wizardlink.com')
    get go_to_site_account_path(id: accounts(:conta_itau).slug)

    assert_redirected_to 'www.wizardlink.com'
  end

  test '#go_to_site creates a product redirect for account' do
    assert_difference 'ProductRedirect.count' do
      get go_to_site_account_path(id: accounts(:conta_itau).slug)
    end

    assert_equal accounts(:conta_itau), ProductRedirect.last.product
  end
end

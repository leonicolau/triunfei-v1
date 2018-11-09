require 'test_helper'

class LoansControllerTest < ActionDispatch::IntegrationTest
 test "#index display correct title" do
    get loans_url

    assert_response :success

    get "#{loans_url}/filtro/bradesco"

    assert_select 'title', 'Empréstimos Bradesco: como solicitar, fazer, conseguir, tirar Empréstimos Bradesco online'
    assert_select '.main-title-page', 'Compare e solicite empréstimos Bradesco que selecionamos pra você!'
  end

  test '#index display loans tips' do
    get loans_url
    assert_select '.tip-item', count: 2
    assert_match product_tips(:loan).title, response.body
  end

  test '#index display more info modal' do
    get loans_url
    assert_select 'div.more-info-bank'
  end

  test '#index display ribbon partial when loan has highlighted flag as true' do
    loans(:itau_emprestimo).update!(highlighted: true)
    get loans_url
    assert_select "#loan-#{loans(:itau_emprestimo).id} .ribbon-right"
    assert_select "#loan-#{loans(:itau_emprestimo).id} .ribbon-left"
  end

  test '#show display correct meta tag' do
    get loan_url(loans(:bradesco_emprestimo))

    assert_response :success
    assert_select "meta[name=#{meta_tags(:loan_description).name}]", 1
  end

  test '#go_to_site redirects to loan link when wizard_link is blank' do
    get go_to_site_loan_path(id: loans(:bradesco_emprestimo).slug)

    assert_redirected_to loans(:bradesco_emprestimo).link
  end

  test '#go_to_site redirects to loan wizard_link when wizard_link is present' do
    loans(:itau_emprestimo).update(wizard_link: 'www.wizardlink.com')
    get go_to_site_loan_path(id: loans(:itau_emprestimo).slug)

    assert_redirected_to 'www.wizardlink.com'
  end

  test '#go_to_site creates a product redirect for loan' do
    assert_difference 'ProductRedirect.count' do
      get go_to_site_loan_path(id: loans(:itau_emprestimo).slug)
    end

    assert_equal loans(:itau_emprestimo), ProductRedirect.last.product
  end
end

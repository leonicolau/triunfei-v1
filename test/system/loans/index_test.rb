# frozen_string_literal: true
require "application_system_test_case"

class LoansIndexTest < ApplicationSystemTestCase

  test 'user can filter loan' do
    visit loans_path

    page.execute_script('window.scrollTo(0,500)')

    check "bank-#{banks(:bradesco).id}"

    assert "/emprestimos/filtro/bradesco-emprestimo", current_path
  end

  test 'should show bank filter that has loans associated' do
    visit loans_path
    assert page.has_field?("bank-#{banks(:bradesco).id}")
    assert page.has_no_field?("bank-#{banks(:original).id}")
  end

  test 'go to site should redirect to wizard_link' do
    visit loans_path

    check "bank-#{banks(:itau).id}"

    click_on 'Solicitar Empréstimo', match: :first

    assert "/wizards/teste", current_path
  end

  test 'user can see displayed quota' do
    Loan.where.not(id: loans(:bradesco_emprestimo).id).delete_all
    visit loans_path

    assert_selector '.loan-quota' do
    assert_text ('R$ 177,70')
    end
  end


  test 'more_info button should redirect to info page' do
    Loan.where.not(id: loans(:bradesco_emprestimo).id).delete_all
    visit loans_path

    click_on 'Saiba mais'
    assert "/emprestimos/bradesco-emprestimo", current_path
  end

end

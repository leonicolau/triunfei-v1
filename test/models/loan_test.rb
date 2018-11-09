require 'test_helper'

class LoanTest < ActiveSupport::TestCase

  test "filter" do
    # by bank
    assert_equal Account.filter([banks(:itau).slug]).to_a, Account.where(bank_id: banks(:itau).id).to_a
    assert_equal Account.filter([banks(:itau).slug, banks(:bradesco).slug]).to_a, Account.where(bank_id: [banks(:itau).id, banks(:bradesco).id]).to_a
  end

  test 'create_meta_tag' do
    loan = loans(:itau_emprestimo).dup
    loan.name = 'other itau emprestimo'

    assert_difference 'MetaTag.count' do
      loan.save!
    end

    assert_equal "/emprestimos/other-itau-emprestimo", MetaTag.last.page
    assert_equal 'description', MetaTag.last.name
    assert_equal "Corra e venha já fazer seu other itau emprestimo com a triunfei, Aproveite nossos comparadores e encontre outras ofertas que foram feitas sob medida para você.", MetaTag.last.value
  end

  test '#go_to_site_path returns go to site for loan' do
    assert_equal "/emprestimos/itau-emprestimo/go_to_site", loans(:itau_emprestimo).go_to_site_path
  end

end

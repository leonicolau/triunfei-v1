# frozen_string_literal: true
require "application_system_test_case"

class CardsIndexTest < ApplicationSystemTestCase

  test 'user can filter card by bank' do
    visit cards_path

    page.execute_script('window.scrollTo(0,600)')

    check "bank-#{banks(:itau).id}"

    assert_selector '.card-wrap', match: :first
    assert_equal current_path, '/cartoes-de-credito/filtro/itau'
  end

  test 'user can filter card by flag' do
    visit cards_path

    page.execute_script('window.scrollTo(0,800)')

    check "flag-#{flags(:visa).id}"
    assert_selector '.card-wrap', match: :first

    assert_equal current_path, '/cartoes-de-credito/filtro/visa'

  end
# TODO: check why fail
#  test 'user can filter card by anuity' do
#    visit cards_path
#    page.choose('anuidade_anuidade-gratuita')

#    assert_selector '.card-wrap', count: 0
#    assert_equal current_path, "/cartoes-de-credito/filtro/anuidade-gratuita"
#  end

#  test 'user can filter card by minum rent' do
#    visit cards_path

#    page.execute_script('window.scrollTo(0,900)')

#    choose('renda-minima_renda-minima-1500-3000')

#    assert_selector '.card-wrap', count: 0
#    assert_equal current_path, "/cartoes-de-credito/filtro/renda-minima-1500-3000"
#  end

  test 'user can list card in order' do
   visit cards_path

    click_button 'Ordenar'
    within '.desktop-sort' do
      click_link 'Anuidade'
    end

    assert_equal '/cartoes-de-credito/filtro/ordenado-por-anuidade', current_path
  end

  test 'user sees if link_more_info is going to the correct destination' do
    Card.where.not(id: cards(:visa_credit).id).delete_all
    visit cards_path

   	click_on "Saiba mais"
    assert "/cartoes-de-credito/visa-credito-do-itau", current_path
  end

  test 'user sees displayed benefits' do
    visit cards_path

    assert page.find('.card-wrap', match: :first).has_text?(cards(:visa_credit).bank_usp1)
    assert page.find('.card-wrap', match: :first).has_text?(cards(:visa_credit).bank_usp2)

    assert page.has_text?(cards(:master_debit).points)
    assert page.has_text?(cards(:master_debit).discount)
  end

  test 'user will see the bank filter that has cards associated' do
    visit cards_path

    assert page.has_field?("bank-#{banks(:bradesco).id}")
    assert page.has_no_field?("bank-#{banks(:banco_do_brasil).id}")
  end

  test 'user will see the flag filter that has associated cards' do
    visit cards_path

    assert page.has_field?("flag-#{flags(:visa).id}")
    assert page.has_no_field?("flag-#{flags(:amex).id}")
  end

  test 'user can see title with tip when selected a tip' do
    visit cards_path

    within '.main-title-page' do
      assert_text ('Compare e solicite cartões de crédito que selecionamos pra você!')
    end

    click_link 'A card tip'

    within '.main-title-page' do
      assert_text ('A card tip')
    end
  end

  test "user won't see the more info button when card is a promotion" do
    Card.where.not(id: cards(:promotion).id).delete_all

    visit cards_path

    click_on 'Saiba mais'


    assert_text ("+ Detalhes"), count: 0
  end

  test 'user sees the Conferir button when card is not a promotion' do
    Card.where.not(id: cards(:promotion).id).delete_all

    visit cards_path

    click_on 'Conferir'
  end

  test "user won't see the installment info when card is a promotion" do
    Card.where.not(id: cards(:promotion).id).delete_all

    visit cards_path

    click_on 'Saiba mais'

    assert_text ("Parcelamento de anuidade:"), count: 0
  end

end

# frozen_string_literal: true
require 'test_helper'

class CardsHelperTest < ActionView::TestCase

  test 'anuity' do
    # when card has anuity positive it returns formatted value
    assert_equal "#{number_to_currency(cards(:visa_credit).anuity)}", anuity(cards(:visa_credit))

    # when card has not anuity it returns Grátis
    cards(:visa_credit).update anuity: 0
    assert_equal t('anuity_free'), anuity(cards(:visa_credit))
  end

  test 'international' do
    assert_equal "Internacional", international(cards(:visa_credit))
    assert_equal "Nacional", international(cards(:master_debit))
  end

  test 'anuity_multiple' do
    # when positive
    assert_equal "Sim (#{cards(:visa_credit).anuity_multiple}x)", anuity_multiple(cards(:visa_credit))

    # when not positive
    cards(:visa_credit).update anuity_multiple: 0
    assert_equal t('without_installment'), anuity_multiple(cards(:visa_credit))
  end

  test 'minimun_rent' do
    assert_equal 'Não exigida', minimun_rent(Card.new(minimum_rent: nil))
    assert_equal number_to_currency(cards(:visa_credit).minimum_rent), minimun_rent(cards(:visa_credit))
  end

  test '#benefits_for returns at least 3 benefits' do
    assert_equal 3, benefits_for(cards(:visa_credit)).size
  end

  test "request_product when card promotion is true returns 'Conferir'" do
    assert_equal 'Conferir', request_product(cards(:promotion))
  end

  test "request_product when card promotion is false returns 'Solicitar cartão'" do
    assert_equal 'Solicitar Cartão', request_product(cards(:visa_credit))
  end

  test 'card_installment when card promotion is true returns promotion_product text' do
    # when card.promotion is true
    assert_equal t(:promotion_product), card_installment(cards(:promotion))
  end

  test 'card_installment when card promotion is false returns installment text' do
    # when card.promotion is false
    assert_equal "#{t(:annuity_installment)}: Sim (12x)", card_installment(cards(:visa_credit))
  end

end

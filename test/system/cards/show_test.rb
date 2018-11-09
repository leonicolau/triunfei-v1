require "application_system_test_case"

class CardsShowTest < ApplicationSystemTestCase

include ActionView::Helpers::NumberHelper

  test 'user sees recarga mensal' do
    visit card_path(cards(:original))
    assert_text 'Limite de recarga'
  end

  test 'user sees monthly recharge' do
    visit card_path(cards(:original))
    assert_text 'R$ 99.9'
  end

end

require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  include ActionView::Helpers::NumberHelper

  test "#index renders correct title for each option in card" do
    get cards_url

    assert_response :success
    assert_select 'title', 'Cartão de Crédito  : como solicitar, fazer, conseguir, tirar Cartões de Crédito  online'
    assert_select '.main-title-page', 'Compare e solicite cartões de crédito     que selecionamos pra você!'

    get "#{cards_url}/filtro/itau"

    assert_select 'title', 'Cartão de Crédito Itau : como solicitar, fazer, conseguir, tirar Cartões de Crédito Itau online'
    assert_select '.main-title-page', 'Compare e solicite cartões de crédito Itau    que selecionamos pra você!'

    get "#{cards_url}/filtro/visa"

    assert_select 'title', 'Cartão de Crédito  Visa: como solicitar, fazer, conseguir, tirar Cartões de Crédito  online'
    assert_select '.main-title-page', 'Compare e solicite cartões de crédito  Visa   que selecionamos pra você!'
  end

  test '#index display more info bank button' do
    get cards_url
    assert_select 'div.more-info-bank'
  end

  test '#index display more details button when card is not a promotion' do
    Card.where.not(id: cards(:visa_credit).id).delete_all

    get cards_url
    assert_select '.more-details-button', count: 1
  end

  test '#index display more details button when card is a promotion' do
    Card.where.not(id: cards(:promotion).id).delete_all

    get cards_url
    assert_select '.more-details-button', count: 0
  end

  test '#index display cards tips' do
    get cards_url
    assert_select '.tip-item', count: 2
    assert_match product_tips(:card).title, response.body
  end

  test '#index display ribbon partial when card has highlighted flag as true' do
    cards(:visa_credit).update!(highlighted: true)
    get cards_url
    assert_select "#card-#{cards(:visa_credit).id} .ribbon-right"
    assert_select "#card-#{cards(:visa_credit).id} .ribbon-left"
  end

  test '#show renders correct information for card' do

    get card_url(id: cards(:visa_credit).slug)

    assert_response :success
    assert_select '.product-text p' do |element|
      assert_equal element[1].text, "Banco: #{cards(:visa_credit).bank.name}"
      assert_equal element[2].text, "Bandeira: #{cards(:visa_credit).flag.name}"
      assert_equal element[3].text, "Anuidade: #{number_to_currency(cards(:visa_credit).anuity)}"
      assert_equal element[4].text, "Parcelamento de anuidade: Sim (#{cards(:visa_credit).anuity_multiple}x)"
      assert_equal element[5].text, "Renda mínima: #{number_to_currency(cards(:visa_credit).minimum_rent)}"
    end
    assert_select '.product-text h1' do |element|
      assert_equal element[0].text, "Cartão de Crédito #{cards(:visa_credit).name}"
    end

    assert_select "meta[name=#{meta_tags(:card_description).name}]", 1
    assert_select "meta[name=#{meta_tags(:card_keywords).name}]", 1
  end

  test '#go_to_site redirects to card link' do
    get go_to_site_card_path(id: cards(:visa_credit).slug)

    assert_redirected_to cards(:visa_credit).link_with_utm
  end

  test '#go_to_site creates a product redirect for card' do
    assert_difference 'ProductRedirect.count' do
      get go_to_site_card_path(id: cards(:visa_credit).slug)
    end

    assert_equal cards(:visa_credit), ProductRedirect.last.product
  end

  test '#go_to_site perform PostbackUrlJob when params cid is present and card has postback url' do
    cards(:visa_credit).bank.update(card_postback_url: 'www.somepostbackurl.com?cid=%{cid}')
    spy = Spy.on(PostbackUrlJob, :perform_later)

    get go_to_site_card_path(id: cards(:visa_credit).slug), params: { cid: 'cid123' }

    assert spy.has_been_called_with?('www.somepostbackurl.com?cid=cid123')
  end
end

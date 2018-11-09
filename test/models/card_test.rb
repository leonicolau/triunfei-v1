require 'test_helper'

class CardTest < ActiveSupport::TestCase
  include Rails.application.routes.url_helpers

  test "filter" do
    # by bank
    assert_equal Card.filter([banks(:itau).slug]).to_a, Card.where(bank_id: banks(:itau).id).to_a
    assert_equal Card.filter([banks(:itau).slug, banks(:bradesco).slug]).to_a, Card.where(bank_id: [banks(:itau).id, banks(:bradesco).id]).to_a

    # by flag
    assert_equal Card.filter([flags(:visa).slug]).to_a, Card.where(flag_id: flags(:visa).id).to_a
    assert_equal Card.filter([flags(:visa).slug, flags(:master).slug]).to_a, Card.where(flag_id: [flags(:visa).id, flags(:master).id]).to_a

    # by flag and bank
    assert_equal Card.filter([banks(:itau).slug, flags(:visa).slug]).to_a, Card.where(bank_id: banks(:itau).id, flag_id: flags(:visa).id).to_a

    

    # order
    assert_equal "SELECT \"cards\".* FROM \"cards\" WHERE \"cards\".\"deleted_at\" IS NULL AND \"cards\".\"active\" = TRUE ORDER BY \"cards\".\"order\" DESC", Card.filter(['ordenado-por-mais-relevantes']).to_sql
    assert_equal "SELECT \"cards\".* FROM \"cards\" WHERE \"cards\".\"deleted_at\" IS NULL AND \"cards\".\"active\" = TRUE ORDER BY \"cards\".\"anuity\" ASC", Card.filter(['ordenado-por-anuidade']).to_sql
    assert_equal "SELECT \"cards\".* FROM \"cards\" WHERE \"cards\".\"deleted_at\" IS NULL AND \"cards\".\"active\" = TRUE ORDER BY \"cards\".\"minimum_rent\" ASC", Card.filter(['ordenado-por-renda-minima']).to_sql

    # by anuity
    assert_equal Card.filter(['anuidade-gratuita']).to_sql, "SELECT \"cards\".* FROM \"cards\" WHERE \"cards\".\"deleted_at\" IS NULL AND \"cards\".\"active\" = TRUE AND (anuity IS NULL or anuity = 0) ORDER BY \"cards\".\"order\" DESC"
    assert_equal Card.filter(['anuidade-0-5']).to_sql, "SELECT \"cards\".* FROM \"cards\" WHERE \"cards\".\"deleted_at\" IS NULL AND \"cards\".\"active\" = TRUE AND (anuity >= '0' AND anuity <= '5') ORDER BY \"cards\".\"order\" DESC"

    # by rents
    assert_equal Card.filter(['renda-minima-naoexigida']).to_sql, "SELECT \"cards\".* FROM \"cards\" WHERE \"cards\".\"deleted_at\" IS NULL AND \"cards\".\"active\" = TRUE AND (minimum_rent IS NULL or minimum_rent = 0) ORDER BY \"cards\".\"order\" DESC"
    assert_equal Card.filter(['renda-minima-0-5']).to_sql, "SELECT \"cards\".* FROM \"cards\" WHERE \"cards\".\"deleted_at\" IS NULL AND \"cards\".\"active\" = TRUE AND (minimum_rent >= '0' AND minimum_rent <= '5') ORDER BY \"cards\".\"order\" DESC"
  end

  test 'link_with_utm' do
    # when it already has params, should append to params
    card = Card.new(link: 'http://santander.com?key=value', bank: banks(:bradesco))
    assert_equal 'http://santander.com?key=value&utm_source=triunfei', card.link_with_utm

    # when it has not params, should put param
    card = Card.new(link: 'http://santander.com', bank: banks(:bradesco))
    assert_equal 'http://santander.com?utm_source=triunfei', card.link_with_utm

  end

  test 'link_with_view' do
    # when bank has affiliate link should return affiliate link
    card = Card.new(id: 1, bank: banks(:bradesco))
    assert_equal banks(:bradesco).affiliate_link.gsub('%{url_path}', go_to_site_card_path(card)).gsub('%{card_id}', card.id.to_s), card.link_to_view

    # when bank has not affiliate link should return go to site
    card = Card.new(id: 1, bank: banks(:original))
    assert_equal go_to_site_card_path(card), card.link_to_view
  end

  test 'link_more_info' do
    card = cards(:visa_credit)
    assert_equal '/cartoes-de-credito/visa-credito-do-itau', card.link_more_info

    card = cards(:cartao_original)
    assert_equal 'o-melhor-cartao-de-credito', card.link_more_info

  end

  test 'create_meta_tag' do
    MetaTag.destroy_all
    card = cards(:visa_credit).dup

    assert_difference 'MetaTag.count', 2 do
      card.save!
    end

    assert_equal "/cartoes-de-credito/visa-credit-do-itau", MetaTag.first.page
    assert_equal 'description', MetaTag.first.name
    assert_equal "Corra e venha já fazer seu #{card.name} com a triunfei, aproveite nossos comparadores e encontre outras ofertas que foram feitas sob medida para você.", MetaTag.first.value
    assert_equal 'keywords', MetaTag.last.name
    assert_equal "#{card.name}, cartões sem renda", MetaTag.last.value
    assert_equal "/cartoes-de-credito/visa-credit-do-itau", MetaTag.last.page
  end

  test '#go_to_site_path returns go to site for card' do
    assert_equal "/cartoes-de-credito/visa-credito-do-itau/go_to_site", cards(:visa_credit).go_to_site_path
  end

end

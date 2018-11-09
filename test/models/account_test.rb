require 'test_helper'

class AccountTest < ActiveSupport::TestCase

  test "#filter filters by bank" do
    assert_equal Account.filter([banks(:itau).slug]).to_a, Account.where(bank_id: banks(:itau).id).to_a
    assert_equal Account.filter([banks(:itau).slug, banks(:bradesco).slug]).to_a, Account.where(bank_id: [banks(:itau).id, banks(:bradesco).id]).to_a
  end

  test "#filter filters by taxes" do
    assert_equal Account.filter(['custo-mensal-gratuito']).to_sql, "SELECT \"accounts\".* FROM \"accounts\" WHERE \"accounts\".\"deleted_at\" IS NULL AND \"accounts\".\"active\" = TRUE AND (taxes IS NULL or taxes = 0) ORDER BY \"accounts\".\"order\" DESC"
    assert_equal Account.filter(['custo-mensal-0-5']).to_sql, "SELECT \"accounts\".* FROM \"accounts\" WHERE \"accounts\".\"deleted_at\" IS NULL AND \"accounts\".\"active\" = TRUE AND (taxes >= '0' AND taxes <= '5') ORDER BY \"accounts\".\"order\" DESC"
  end

  test "#filter filters by rents" do
    assert_equal Account.filter(['renda-minima-naoexigida']).to_sql, "SELECT \"accounts\".* FROM \"accounts\" WHERE \"accounts\".\"deleted_at\" IS NULL AND \"accounts\".\"active\" = TRUE AND (minimum_rent IS NULL or minimum_rent = 0) ORDER BY \"accounts\".\"order\" DESC"
    assert_equal Account.filter(['renda-minima-0-1500']).to_sql, "SELECT \"accounts\".* FROM \"accounts\" WHERE \"accounts\".\"deleted_at\" IS NULL AND \"accounts\".\"active\" = TRUE AND (minimum_rent >= '0' AND minimum_rent <= '1500') ORDER BY \"accounts\".\"order\" DESC"
  end

  test '#filter orders by taxas' do
    assert_equal Account.filter(['ordenado-por-customensal']).to_sql, "SELECT \"accounts\".* FROM \"accounts\" WHERE \"accounts\".\"deleted_at\" IS NULL AND \"accounts\".\"active\" = TRUE ORDER BY \"accounts\".\"taxes\" ASC"
  end

  test '#create_meta_tag creates default meta tag for account' do
    account = accounts(:conta_itau).dup
    account.name = 'other account itau'
    assert_difference 'MetaTag.count' do
      account.save!
    end

    assert_equal "/contas-corrente/other-account-itau", MetaTag.last.page
    assert_equal 'description', MetaTag.last.name
    assert_equal "Corra e venha já fazer sua #{account.name} com a triunfei, Aproveite nossos comparadores e encontre outras ofertas que foram feitas sob medida para você.", MetaTag.last.value
  end

  test '#go_to_site_path returns go to site for account' do
    assert_equal "/contas-corrente/conta-itau/go_to_site", accounts(:conta_itau).go_to_site_path
  end
end

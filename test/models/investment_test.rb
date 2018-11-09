require 'test_helper'

class InvestmentTest < ActiveSupport::TestCase
  include Rails.application.routes.url_helpers

  test "#filter filters by broker" do
    assert_equal Investment.filter([brokers(:xp).slug]).to_a, Investment.where(broker_id: brokers(:xp).id).to_a
  end

  test "#filter filters by duration" do
    assert_equal Investment.filter(['duracao-200-300']).to_sql, "SELECT \"investments\".* FROM \"investments\" WHERE \"investments\".\"deleted_at\" IS NULL AND (duration >= '200' AND duration <= '300') ORDER BY \"investments\".\"order\" DESC"
    assert_equal Investment.filter(['duracao-300-500']).to_sql, "SELECT \"investments\".* FROM \"investments\" WHERE \"investments\".\"deleted_at\" IS NULL AND (duration >= '300' AND duration <= '500') ORDER BY \"investments\".\"order\" DESC"
  end

  test "#filter filters by fixed remuneration" do
    assert_equal Investment.filter(['tipo-titulo-lci']).to_sql, "SELECT \"investments\".* FROM \"investments\" WHERE \"investments\".\"deleted_at\" IS NULL AND \"investments\".\"fixed_remuneration\" = 0 ORDER BY \"investments\".\"order\" DESC"
    assert_equal Investment.filter(['tipo-tesouro-direto']).to_sql, "SELECT \"investments\".* FROM \"investments\" WHERE \"investments\".\"deleted_at\" IS NULL AND \"investments\".\"fixed_remuneration\" = 2 ORDER BY \"investments\".\"order\" DESC"
  end

  test "#filter order results" do
    assert_equal Investment.filter(['ordenado-por-retorno-esperado']).to_sql, "SELECT \"investments\".* FROM \"investments\" WHERE \"investments\".\"deleted_at\" IS NULL ORDER BY \"investments\".\"expected_return\" ASC, \"investments\".\"asc\" ASC"
    assert_match "ORDER BY \"investments\".\"duration\" ASC", Investment.filter(['ordenado-por-duracao']).to_sql
  end

  test '#go_to_site_path returns go to site for investment' do
    assert_equal "/investimentos/investimento-santander/go_to_site", investments(:investimento_santander).go_to_site_path
  end

end

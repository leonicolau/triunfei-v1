require 'test_helper'

class InsuranceTest < ActiveSupport::TestCase

  test "#filter orders by order column" do
    assert_match "ORDER BY \"insurances\".\"order\" DESC", Insurance.filter(['ordenado-por-mais-relevantes']).to_sql
  end

  test "#filter orders by benefits column" do
    assert_match "ORDER BY \"insurances\".\"benefits\" ASC", Insurance.filter(['ordenado-por-beneficios']).to_sql
  end

  test "#filter orders by insurer id column" do
    assert_match "ORDER BY \"insurances\".\"insurer_id\" ASC", Insurance.filter(['ordenado-por-seguradora']).to_sql
  end

end

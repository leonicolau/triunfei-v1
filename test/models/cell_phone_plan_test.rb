require 'test_helper'

class CellPhonePlanTest < ActiveSupport::TestCase
  test '.filter users "ordenado-por" label to order cell phone plans' do
    result = CellPhonePlan.filter([])
    assert_equal cell_phone_plans(:claro_controle), result.first

    result = CellPhonePlan.filter(['ordenado-por-internet'])

    assert_equal cell_phone_plans(:vivo_mais), result.first
  end
end

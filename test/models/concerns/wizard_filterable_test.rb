require 'test_helper'

class WizardFilterableTest < ActiveSupport::TestCase

  test '.mount_query_for returns correct query when search_type if between' do
    assert_equal 'minimum_rent <= :field OR minimum_rent >= :field', Card.mount_query_for('between', 'minimum_rent')
  end

  test '.mount_query_for returns correct query when search_type if less_than' do
    assert_equal 'minimum_rent <= :field', Card.mount_query_for('less_than', 'minimum_rent')
  end

  test '.mount_query_for returns correct query when search_type if greater_than' do
    assert_equal 'minimum_rent >= :field', Card.mount_query_for('greater_than', 'minimum_rent')
  end

  test '.mount_query_for returns correct query when search_type is other thing' do
    assert_equal 'minimum_rent = :field', Card.mount_query_for('no_option', 'minimum_rent')
  end

  test '.wizard_filter returns correct card for wizard field answer' do
    wizard_fields(:name).update(search_type: :equal)
    wizard_user = users(:leonardo).user_wizards.create!(wizard: wizards(:santander))
    wizard_user.user_wizard_answers.create!(wizard_field: wizard_fields(:name), value: cards(:visa_credit).name)

    assert_equal [cards(:visa_credit)], Card.wizard_filter(wizard_user).to_a
  end

  test '.wizard_filter returns correct card taking in consideration the daily limit' do
    wizard_fields(:bank_id).update(search_type: :equal)
    wizard_user = users(:leonardo).user_wizards.create!(wizard: wizards(:santander))
    wizard_user.user_wizard_answers.create!(wizard_field: wizard_fields(:bank_id), value: banks(:original).id)

    assert_equal 2, Card.wizard_filter(wizard_user).count

    cards(:original).update!(max_daily_redirect: 1)
    cards(:original).product_redirects.create!

    result = Card.wizard_filter(wizard_user)
    assert_equal 1, result.count
    assert_equal [cards(:cartao_original)], result.to_a
  end
end
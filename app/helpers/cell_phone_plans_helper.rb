# frozen_string_literal: true

module CellPhonePlansHelper
  def title_for_cell_phone_plans_index
    operator_name = ''
    tip = process_title_tip

    Operator.all.each do |operator|
      include_param = params[:path]&.include?(operator.name.parameterize)
      operator_name = operator.name.humanize.gsub(/[A-Za-z']+/, &:capitalize) if include_param
    end

    if params[:tip].present?
      t('titles.cards.card_tip', tip: tip).tr('-', ' ').capitalize
    else
      t('titles.cell_phone_plans.index', operator: operator_name)
    end
  end

  def h1_for_cell_phone_plans_index
    operator_name = ''
    tip = process_tip

    Operator.all.each do |operator|
      include_param = params[:path]&.include?(operator.name.parameterize)
      operator_name = operator.name.humanize.gsub(/[A-Za-z']+/, &:capitalize) if include_param
    end

    if params[:tip].present?
      t('cards.index.title_tips', tip: tip)
    else
      t('cell_phone_plans.index.title', operator: operator_name)
    end
  end

  def gb(cell_phone_plan)
    cell_phone_plan.gb.positive? ? number_to_currency(cell_phone_plan.gb).to_s : 'Sem Internet'
  end

  def benefits_plan_for(cell_phone_plan)
    [cell_phone_plan.description, cell_phone_plan.description_brand,
     cell_phone_plan.gb, cell_phone_plan.minutes].compact[0..1]
  end

  def process_tip
    return if params[:tip].blank?
    t('cards.with_tip.until', value: params[:tip])
  end

  def process_title_tip
    return if params[:tip].blank?
    t('cards.with_title_tip.title_tip', value: params[:tip])
  end
end

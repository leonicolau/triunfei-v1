# frozen_string_literal: true

module InsurancesHelper
  def title_for_insurances_index
    insurer_name = ''
    tip = process_title_tip

    Insurer.all.each do |insurer|
      include_param = params[:path]&.include?(insurer.name.parameterize)
      insurer_name = insurer.name.humanize.gsub(/[A-Za-z']+/, &:capitalize) if include_param
    end

    if params[:tip].present?
      t('titles.insurances.insurance_tip', tip: tip).tr('-', ' ').capitalize
    else
      t('titles.insurances.index', insurer: insurer_name)
    end
  end

  def h1_for_insurances_index
    insurer_name = ''
    tip = process_tip

    Insurer.all.each do |insurer|
      include_param = params[:path]&.include?(insurer.name.parameterize)
      insurer_name = insurer.name.humanize.gsub(/[A-Za-z']+/, &:capitalize) if include_param
    end

    if params[:tip].present?
      t('insurances.index.title_tips', tip: tip)
    else
      t('insurances.index.title', insurer: insurer_name)
    end
  end

  def benefits_insurance(insurance)
    [insurance.benefits].compact[0..1]
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

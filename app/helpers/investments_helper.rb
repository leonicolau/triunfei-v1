# frozen_string_literal: true

module InvestmentsHelper
  # rubocop:disable Metrics/AbcSize
  def title_for_investments_index
    broker_name = ''
    tip = process_title_tip
    duration = process_duration
    fixed_remuneration = process_remuneration

    Broker.all.each do |broker|
      include_param = params[:path]&.include?(broker.name.parameterize)
      broker_name = broker.name.humanize.gsub(/[A-Za-z']+/, &:capitalize) if include_param
    end

    if params[:tip].present?
      t('titles.investments.investment_tip', tip: tip).tr('-', ' ').capitalize
    else
      t('titles.investments.index', broker: broker_name, duration: duration, fixed_remuneration: fixed_remuneration)
    end
  end

  def h1_for_investments_index
    broker_name = ''
    tip = process_tip
    duration = process_duration
    fixed_remuneration = process_remuneration

    Broker.all.each do |broker|
      include_param = params[:path]&.include?(broker.name.parameterize)
      broker_name = broker.name.humanize.gsub(/[A-Za-z']+/, &:capitalize) if include_param
    end

    if params[:tip].present?
      t('investments.index.title_tips', tip: tip)
    else
      t('investments.index.title', broker: broker_name, fixed_remuneration: fixed_remuneration, duration: duration)
    end
  end

  def process_tip
    return if params[:tip].blank?
    t('cards.with_tip.until', value: params[:tip])
  end

  def process_remuneration
    return unless params[:path]&.include?('tipo')
    fixed_remuneration = params[:path].match(/tipo-([a-zA-Z]+)-([a-zA-Z]+)/)
    if fixed_remuneration
      t('investments.with_fixed_remuneration.until', value: (fixed_remuneration[0]).titleize)
    else
      t('investments.with_fixed_remuneration.no_fixed_remuneration')
    end
  end

  def process_duration
    return unless params[:path]&.include?('duracao')
    duration = params[:path].match(/duracao-([0-9]+)-([0-9]+)/)
    if duration
      t('investments.with_duration.until', value: duration[2])
    else
      t('investments.with_duration.no_duration')
    end
  end

  def process_title_tip
    return if params[:tip].blank?
    t('cards.with_title_tip.title_tip', value: params[:tip])
  end

  def return_of_investment(investment)
    investment.post_fixed? ? investment.year_return_expectation_value : investment.gross_profitability
  end
  # rubocop:enable Metrics/AbcSize
end

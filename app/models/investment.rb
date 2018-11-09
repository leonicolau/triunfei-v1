# frozen_string_literal: true

class Investment < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId
  friendly_id :name, use: :slugged
  include Excel

  DEFAULT_VALUE_FOR_FILTER = 10_000
  DEFAULT_VALUE_FOR_TIME_VALUE = 700
  # rubocop:disable Style/PercentLiteralDelimiters
  ORDER_COLUMNS = { duracao: %i[duration asc], retornoesperado: %i[expected_return asc] }.freeze

  enum fixed_remuneration: %i[letter_of_credit
                              bankary_deposit_receipt
                              treasury_direct
                              agribusiness_credit_letter
                              bill_of_exchange]

  enum type_of_profitability: %i[high_yield
                                 more_risk]
  # rubocop:enable Style/PercentLiteralDelimiters
  belongs_to :broker
  belongs_to :bank

  default_scope { order(order: :desc) }

  validates :broker_id, :bank_id, :name, :fixed_remuneration, :gross_profitability, presence: true

  def post_fixed?
    profitability_category_name == 'Pós'
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def self.filter(params)
    params = [] if params.nil?

    order = params.select { |filter| filter.include?('ordenado-por') }
    params -= order
    order = order.try(:last)

    fixed_types = params.select { |filter| filter.include?('tipo-') }
    params -= fixed_types

    times = params.select { |filter| filter.include?('duracao') }
    params -= times

    result = self

    if order
      result = result.unscope(:order)
      result = result.order(ORDER_COLUMNS[order.split('-')[2..10].join('').to_sym])
    end

    brokers = []

    params.each do |param|
      brokers << Broker.find_by(slug: param)
    end

    fixed_types.each do |type|
      type = I18n.t("enum.fixed_remunerations.#{type.gsub(/tipo-/, '')}", locale: :en)

      result = result.where(fixed_remuneration: type)
    end

    # filter by duration
    times.each do |time|
      time = time.split('-')
      result = if time[1] == '0'
                 result.where('duration IS NULL or duration = 0')
               else
                 result.where('duration >= ? AND duration <= ?', time[1], time[2])
               end
    end
    result = result.where(broker_id: brokers.compact.pluck(:id)) if brokers.compact.present?
    result
  end

  def quota(amount = nil, time_value = nil, cdi = nil, _cdi_variable = nil, date = nil)
    amount ||= DEFAULT_VALUE_FOR_FILTER
    time_value ||= DEFAULT_VALUE_FOR_TIME_VALUE
    cdi = (6.39 / 100)
    date = 365
    cdi_return = yearly_profitability_value
    cdi_variavel = ((gross_return.to_f / 100) + ((cdi_return.to_f / 100) * cdi.to_f))

    amount.to_f * (1 + cdi_variavel.to_f)**(time_value.to_f / date.to_f)
  end

  def ipcavalue(_result)
    (0.33 + 4).to_f.round(2)
  end

  def profitability_value(_result)
    if post_fixed?
      ((year_return_expectation_value * 100)).to_f.round(2)
    else
      ((gross_profitability * 0.0639) * 100).to_f.round(2)
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  def go_to_site_path
    Rails.application.routes.url_helpers.go_to_site_investment_path(self)
  end
end

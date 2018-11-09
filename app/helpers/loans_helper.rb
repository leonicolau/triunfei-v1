# frozen_string_literal: true
# frozen_string_literal: true

module LoansHelper
  def title_for_loans_index
    bank_name = ''
    tip = process_title_tip

    Bank.all.each do |bank|
      bank_name = bank.name.humanize.gsub(/[A-Za-z']+/, &:capitalize) if params[:path]&.include?(bank.name.parameterize)
    end

    if params[:tip].present?
      t('titles.cards.card_tip', tip: tip).tr('-', ' ').capitalize
    else
      t('titles.loans.index', bank: bank_name)
    end
  end

  def h1_for_loan_index
    bank_name = ''

    Bank.all.each do |bank|
      bank_name = bank.name.humanize.gsub(/[A-Za-z']+/, &:capitalize) if params[:path]&.include?(bank.name.parameterize)
    end

    if params[:tip].present?
      t('cards.index.title_tips', tip: tip)
    else
      t('loan.index.title', bank: bank_name)
    end
  end

  def loan_modal_description(loan)
    loan.bank.loan_bank_description? ? loan.bank.loan_bank_description : t('soon')
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

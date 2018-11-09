# frozen_string_literal: true
# frozen_string_literal: true

module AccountsHelper
  def title_for_accounts_index
    bank_name = ''
    tip = process_title_tip

    Bank.all.each do |bank|
      bank_name = bank.name.humanize.gsub(/[A-Za-z']+/, &:capitalize) if params[:path]&.include?(bank.name.parameterize)
    end

    if params[:tip].present?
      t('titles.cards.card_tip', tip: tip).tr('-', ' ').capitalize
    else
      t('titles.accounts.index', bank: bank_name)
    end
  end

  def h1_for_accounts_index
    bank_name = ''

    Bank.all.each do |bank|
      bank_name = bank.name.humanize.gsub(/[A-Za-z']+/, &:capitalize) if params[:path]&.include?(bank.name.parameterize)
    end

    if params[:tip].present?
      t('cards.index.title_tips', tip: tip)
    else
      t('accounts.index.title', bank: bank_name)
    end
  end

  def taxes_account(account)
    account.taxes.blank? ? t('anuity_free') : number_to_currency(account.taxes)
  end

  def process_tip
    return if params[:tip].blank?
    t('cards.with_tip.until', value: params[:tip])
  end

  def process_title_tip
    return if params[:tip].blank?
    t('cards.with_title_tip.title_tip', value: params[:tip])
  end

  def minimun_deposit(account)
    account.minimum_deposit.blank? ? t('free_unit') : number_to_currency(account.minimum_deposit)
  end

  def account_modal_description(account)
    account.bank.account_bank_description? ? account.bank.account_bank_description : t('soon')
  end
end

# frozen_string_literal: true
# frozen_string_literal: true

module CardsHelper
  # rubocop:disable Metrics/AbcSize

  def title_for_cards_index
    bank_name = ''
    flag_name = ''
    tip = process_title_tip

    Bank.all.each do |bank|
      bank_name = bank.name.humanize.gsub(/[A-Za-z']+/, &:capitalize) if params[:path]&.include?(bank.name.parameterize)
    end

    Flag.all.each do |flag|
      flag_name = flag.name.humanize.gsub(/[A-Za-z']+/, &:capitalize) if params[:path]&.include?(flag.name.parameterize)
    end

    if params[:tip].present?
      t('titles.cards.card_tip', tip: tip).tr('-', ' ').capitalize
    else
      t('titles.cards.index', bank: bank_name, flag: flag_name)
    end
  end

  # rubocop:enable Metrics/AbcSize
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def h1_for_cards_index
    bank_name = ''
    flag_name = ''
    anuity = process_anuity
    minimum_rent = process_minimum_rent
    tip = process_tip

    Bank.all.each do |bank|
      bank_name = bank.name.humanize.gsub(/[A-Za-z']+/, &:capitalize) if params[:path]&.include?(bank.name.parameterize)
    end

    Flag.all.each do |flag|
      flag_name = flag.name.humanize.gsub(/[A-Za-z']+/, &:capitalize) if params[:path]&.include?(flag.name.parameterize)
    end

    if params[:tip].present?
      t('cards.index.title_tips', tip: tip)
    else
      t('cards.index.title', bank: bank_name, flag: flag_name, anuity: anuity, minimum_rent: minimum_rent)
    end
  end

  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength
  def process_anuity
    return unless params[:path]&.include?('anuidade')
    anuity = params[:path].match(/anuidade-([0-9]+)-([0-9]+)/)
    if anuity
      t('cards.with_anuity.until', value: anuity[2])
    else
      t('cards.with_anuity.no_anuity')
    end
  end

  def process_minimum_rent
    return unless params[:path]&.include?('renda-minima')
    anuity = params[:path].match(/renda-minima-([0-9]+)-([0-9]+)/)
    if anuity
      t('cards.with_minimum_rent.until', value: anuity[2])
    else
      t('cards.with_minimum_rent.no_minimum_rent')
    end
  end

  def process_tip
    return if params[:tip].blank?
    t('cards.with_tip.until', value: params[:tip])
  end

  def process_title_tip
    return if params[:tip].blank?
    t('cards.with_title_tip.title_tip', value: params[:tip])
  end

  def anuity(card)
    card.anuity.positive? ? number_to_currency(card.anuity).to_s : t('anuity_free')
  end

  def international(card)
    card.international? ? 'Internacional' : 'Nacional'
  end

  def anuity_multiple(card)
    card.anuity_multiple.positive? ? "#{t('with_installment')} (#{card.anuity_multiple}x)" : t('without_installment')
  end

  def minimun_rent(card)
    card.minimum_rent.blank? ? 'Não exigida' : number_to_currency(card.minimum_rent)
  end

  def benefits_for(card)
    [card.points, card.discount, card.insurance, card.bank_usp1, card.bank_usp2].compact[0..2].compact
  end

  def card_modal_description(card)
    card.bank.card_bank_description? ? card.bank.card_bank_description : t('soon')
  end

  # rubocop:disable Metrics/LineLength
  def card_type_show(card)
    card.card_type == 'pre_paid' ? "#{t('prepaid_card')} #{card.name}" : "#{t('credit_card')} #{card.name}"
  end

  def card_type_column(card)
    card.card_type == 'pre_paid' ? "<h6 class='heading_show'>#{t('money_unit')} #{card.monthly_recharge}</h6> <b class='paragraph'>#{t('recharge_limit')}</b>" : "<h6 class='heading_show fw-bold'> #{anuity_multiple(card)}</h6> <b class='paragraph'> #{t('installments')}</b>"
  end

  def link_to_list(card)
    return card.link_to_view(cid: cid_param) if card.wizard_link.blank?
    controller_name == 'wizards' ? card.link_to_view(cid: cid_param) : card.wizard_link
  end

  def request_product(card)
    card.promotion? ?  t(:go_to_promotion) : t(:go_to_card)
  end

  def more_info_product(card)
    card.promotion? ? t(:more_details) : t(:more_card_details)
  end

  def card_installment(card)
    card.promotion? ? t(:promotion_product).to_s : "#{t(:annuity_installment)}: #{anuity_multiple(card)}"
  end
  # rubocop:enable Metrics/LineLength
end

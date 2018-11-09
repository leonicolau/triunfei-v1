# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
# rubocop:disable Metrics/AbcSize
module WizardFilterable
  extend ActiveSupport::Concern

  included do
    # Allow filter loans given an wizard filter
    #
    # * *Args* :
    #   - +params+ -> WizardUser contains current WizardUser
    # * *Returns* :
    #   - Loans filtered
    # rubocop:disable Metrics/MethodLength
    def self.wizard_filter(wizard_user)
      result = self
      # TODO: check why this is necessary
      return result if wizard_user.nil?

      fields = wizard_user.wizard.wizard_fields.where.not(search_type: nil)
      answers = wizard_user.user_wizard_answers.where(wizard_field: fields)

      fields.each do |field|
        answer = answers.find_by(wizard_field: field)&.value
        result = result.where(mount_query_for(field.search_type, field.name), field: answer)
      end

      product_redirects = ProductRedirect.where(product: result)
                                         .where(created_at: Time.current.at_beginning_of_day..Time.current.end_of_day)
                                         .group(:product_id).count

      result = result.all.to_a.select do |record|
        record.max_daily_redirect.nil? || product_redirects[record.id].to_i < record.max_daily_redirect
      end

      includes = respond_to?(:bank_id) ? [:bank] : []
      where(id: result[0..10].map(&:id)).includes(includes)
    end

    def self.mount_query_for(search_type, field_name)
      case search_type
      when 'between'
        "#{field_name} <= :field OR #{field_name} >= :field"
      when 'less_than'
        "#{field_name} <= :field"
      when 'greater_than'
        "#{field_name} >= :field"
      else
        "#{field_name} = :field"
      end
    end
  end

  # rubocop:enable Metrics/BlockLength
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
end

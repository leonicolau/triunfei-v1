# frozen_string_literal: true

class WizardField < ApplicationRecord
  acts_as_paranoid
  belongs_to :wizard

  validates :label, :name, :step, :field_type, presence: true
  validates :dropdown_options, presence: true, if: -> { field_type == 'dropdown' }
  # rubocop:disable Style/PercentLiteralDelimiters
  enum search_type: %i[equal less_than greater_than between]
  enum field_type: %i[text slider bank_selector dropdown hidden masked]
  # rubocop:enable Style/PercentLiteralDelimiters
  def self.filter(params = {})
    result = self
    result = result.where(wizard_id: params[:wizard_id]) if params[:wizard_id].present?
    result = result.where(step: params[:step]) if params[:step].present?
    result = result.where.not(field_type: :hidden) if params[:visible].present?
    result
  end

  def wizard_field_type
    "wizard-#{field_type.tr('_', '-')}"
  end
end

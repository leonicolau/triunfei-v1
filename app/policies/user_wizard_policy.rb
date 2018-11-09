# frozen_string_literal: true

class UserWizardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin_profile.broker?
        @scope.joins(wizard: :tags).where(wizards: { show_to_broker: true }, tags: { id: user.tag_ids })
      else
        @scope
      end
    end
  end

  def index?
    return true unless user.admin_profile.lp_editor?
  end

  def show?
    return true if user.admin_profile.admin?
    record.admin_user_id == user.id
  end

  # rubocop:disable Style/AccessorMethodName
  def get_lead?
    return false if record.admin_user_id.present?
    return false unless record.wizard.show_to_broker?
    true
  end
  # rubocop:enable Style/AccessorMethodName
end

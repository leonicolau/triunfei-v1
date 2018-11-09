# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record
  # rubocop:disable Style/PercentLiteralDelimiters
  BROKER_ALLOWED_PAGES = %w[Dashboard UserWizard].freeze
  LP_EDITOR_ALLOWED_PAGES = %w[Dashboard LandingPage].freeze
  # rubocop:enable Style/PercentLiteralDelimiters

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    return true if user.admin_profile.admin?
  end

  def show?
    return true if user.admin_profile.admin?
  end

  def create?
    return true if user.admin_profile.admin?
  end

  def new?
    return true if user.admin_profile.admin?
  end

  def update?
    return true if user.admin_profile.admin?
  end

  def edit?
    return true if user.admin_profile.admin?
  end

  def destroy?
    return true if user.admin_profile.admin?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end

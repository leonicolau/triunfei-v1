# frozen_string_literal: true

module ActiveAdmin
  class PagePolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope
      end
    end

    def index?
      return true if user.admin_profile.admin?
      BROKER_ALLOWED_PAGES.include?(record.name) || LP_EDITOR_ALLOWED_PAGES.include?(record.name)
    end

    def show?
      return true if user.admin_profile.admin?
      BROKER_ALLOWED_PAGES.include?(record.name) || LP_EDITOR_ALLOWED_PAGES.include?(record.name)
    end
  end
end

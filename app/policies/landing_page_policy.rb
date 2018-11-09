# frozen_string_literal: true

class LandingPagePolicy < ApplicationPolicy
  def index?
    return true unless user.admin_profile.broker?
  end

  def show?
    return true unless user.admin_profile.broker?
  end

  def create?
    return true unless user.admin_profile.broker?
  end

  def new?
    return true unless user.admin_profile.broker?
  end

  def lead?
    false
  end

  def update?
    return true unless user.admin_profile.broker?
  end

  def edit?
    return true unless user.admin_profile.broker?
  end
end

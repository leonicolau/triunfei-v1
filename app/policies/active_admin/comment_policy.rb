# frozen_string_literal: true

module ActiveAdmin
  class CommentPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope
      end
    end
  end
end

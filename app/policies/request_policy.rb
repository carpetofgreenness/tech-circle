# frozen_string_literal: true

class RequestPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    index?
  end

  def create?
    index?
  end

  def update?
    index?
  end

  class Scope < Scope
    def resolve
      if user.techie?
        scope.all
      else
        scope.where(requester: user)
      end
    end
  end
end
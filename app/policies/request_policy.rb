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
end
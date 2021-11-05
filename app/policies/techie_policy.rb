# frozen_string_literal: true

class TechiePolicy < ApplicationPolicy
  def show?
    @user.techie?
  end
end

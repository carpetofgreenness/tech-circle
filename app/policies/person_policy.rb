# frozen_string_literal: true

class PersonPolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
    @user.techie.present? || !@user.person.present?
  end

  def create?
    @user.techie.present? || !@user.person.present?
  end

  def show?
    index?
  end

  def edit?
    @user.techie.present? || @user.person == @person
  end

  def update?
    edit?
  end
end

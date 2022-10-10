# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :authenticate_user!, unless: :authorization_not_needed?
  after_action :verify_authorized, unless: :authorization_not_needed?

  private

  def authorization_not_needed?
    devise_controller?
  end
end

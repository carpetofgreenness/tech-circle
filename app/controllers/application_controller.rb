# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :authorization_not_needed?
  include Pundit
  after_action :verify_authorized

  private

  def authorization_not_needed?
    devise_controller?
  end
end

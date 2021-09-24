class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :authorization_not_needed?

  private

  def authorization_not_needed?
    devise_controller?
  end
end

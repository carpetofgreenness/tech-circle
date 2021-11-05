# frozen_string_literal: true

# tech circle member specific actions
class TechiesController < ApplicationController
  def show
    @techie = Techie.find_by(user_id: params[:id])
    authorize @techie
  end
end

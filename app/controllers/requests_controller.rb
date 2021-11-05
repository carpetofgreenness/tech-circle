# frozen_string_literal: true

# crud for tech requests
class RequestsController < ApplicationController
  def index
    authorize Request
    @requests = Request.all
  end

  def new
    authorize Request
    @request = Request.new
    @people = Person.all
    @techies = Techie.all
  end

  def create
    authorize Request
    @request = Request.new(request_params)
    if @request.save
      redirect_to :requests, notice: 'Request created successfully'
    else
      flash[:alert] = 'There was an issue creating your request.'
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def request_params
    params.require(:request).permit(:requester_id, :point_person_id, :description)
  end
end

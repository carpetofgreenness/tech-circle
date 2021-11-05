# frozen_string_literal: true

# crud for tech requests
class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def new
    @request = Request.new
    @people = Person.all
    @techies = Techie.all
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to :requests, notice: "Request created successfully"
    else
      flash[:error] = "There was an issue creating your request."
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

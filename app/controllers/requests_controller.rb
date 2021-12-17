# frozen_string_literal: true

# crud for tech requests
class RequestsController < ApplicationController
  before_action :fetch_associated_resources, only: [:new, :create]

  def index
    authorize Request
    @requests = Request.all
    @my_requests = current_user&.techie&.requests
    @unassigned_requests = Request.open
    @other_requests = current_user&.techie&.other_requests
  end

  def new
    @request = authorize Request.new
  end

  def create
    @request = authorize Request.new(request_params)
    if @request.save
      redirect_to :requests, notice: 'Contact info created successfully'
    else
      flash.now[:error] = 'There was an issue creating your contact info.'
      render :new
    end
  end

  def edit
  end

  def update
    @request = authorize Request.find(params[:request][:id])
    @request.update(request_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy

  end

  private

  def request_params
    params.require(:request).permit(:requester_id, :point_person_id, :description, :id)
  end

  def fetch_associated_resources
    @people = Person.all
    @techies = Techie.all
  end

  def fetch_associated_resources
    @people = Person.all
    @techies = Techie.all
  end
end

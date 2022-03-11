# frozen_string_literal: true

# crud for tech requests
class RequestsController < ApplicationController
  before_action :fetch_associated_resources, only: [:new, :create, :edit, :update]

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
      redirect_to :requests, notice: 'Request info created successfully'
    else
      flash.now[:error] = 'There was an issue creating your request.'
      render :new
    end
  end

  def edit
    @request = authorize Request.find(params[:id])
  end

  def update_assignment
    @request = authorize Request.find(params[:request_id])
    @request.update(point_person_id: params[:point_person_id])
    redirect_back(fallback_location: root_path)
  end

  def update
    @request = authorize Request.find(params[:id])
    if @request.update(request_params)
      redirect_to requests_path
    else
      render :edit
    end
  end

  def destroy

  end

  private

  def request_params
    params.require(:request).permit(:requester_id, :point_person_id, :description, :id, :request_type_id, :request_status_id)
  end

  def fetch_associated_resources
    @people = Person.all
    @techies = Techie.all
  end
end

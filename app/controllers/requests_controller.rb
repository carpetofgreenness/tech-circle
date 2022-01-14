# frozen_string_literal: true

# crud for tech requests
class RequestsController < ApplicationController
  before_action :fetch_associated_resources, only: [:index, :new, :create]

  def index
    authorize Request
    @requests = Request.all
  end

  def new
    @request = authorize Request.new
  end

  def create
    @request = authorize Request.new(request_params)

    respond_to do |format|
      if @request.save
        flash.now[:notice] = 'Request created successfully'
        format.html { redirect_to :requests, notice: 'Request created successfully' }
        format.turbo_stream
      else
        flash.now[:error] = 'There was an issue creating your contact info.'
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render :new }
      end
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
    params.require(:request).permit(:requester_id, :point_person_id, :description)
  end

  def fetch_associated_resources
    @people = Person.all
    @techies = Techie.all
  end
end

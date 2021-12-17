# frozen_string_literal: true

# crud for people. this is essentially the directory
class PeopleController < ApplicationController
  def index
    authorize Person
    @people = Person.all
  end

  def new
    @person = authorize Person.new
  end

  def create
    @person = authorize Person.new(person_params)
    redirect_to people_path if @person.save
  end

  def show
    @person = authorize Person.find(params[:id])
  end

  def edit
    @person = authorize Person.find(params[:id])
  end

  def update
    @person = authorize Person.find(person_params[:id])
    redirect_to person_path(@person) if @person.update(person_params)
  end

  private

  def person_params
    params[:person].permit(:id, :first_name, :last_name, :email, :phone_number, :address, :city, :zip)
  end
end

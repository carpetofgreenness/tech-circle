# frozen_string_literal: true

# crud for people. this is essentially the directory
class PeopleController < ApplicationController
  def index
    authorize Person
    @people = Person.all
  end

  def new
    authorize Person
    @person = Person.new
  end

  def create
    authorize Person
    @person = Person.new(person_params)
    redirect_to people_path if @person.save
  end

  def show
    @person = Person.find(params[:id])
    authorize @person
  end

  def edit
    @person = Person.find(params[:id])
    authorize @person
  end

  def update
    @person = Person.find(person_params[:id])
    authorize @person
    redirect_to person_path(@person) if @person.update(person_params)
  end

  private

  def person_params
    params[:person].permit(:id, :first_name, :last_name, :email, :phone_number, :address, :city, :zip)
  end
end

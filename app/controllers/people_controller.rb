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

  private

  def person_params
    params[:person].permit(:first_name, :last_name, :email, :phone_number, :address, :city, :zip)
  end
end

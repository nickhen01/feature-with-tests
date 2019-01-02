class PeopleController < ApplicationController
  before_action :find_person, only: [:show, :edit, :update]

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_attributes)
    if @person.save
      redirect_to @person, notice: "Person created."
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @person.update(person_attributes)
      redirect_to @person, notice: "Person updated."
    else
      render :edit
    end
  end

  private

  def person_attributes
    params.require(:person).permit(:first_name)
  end

  def find_person
    @person = Person.find(params[:id])
  end
end

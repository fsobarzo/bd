class PeopleController < ApplicationController
	 before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    @person = Person.all
  end

  def show
  end

  def new
    @person = Person.new
  end  
end

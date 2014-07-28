class GuestsController < ApplicationController
	
  before_filter :authenticate_user!
  before_action :set_guest, only: [:show, :edit, :update, :destroy]
  
  def index
    @guests = Guest.all
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
 
    respond_to do |format|
      if @guest.save
        format.html { redirect_to @guest, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @guest }
      else
        format.html { render :new }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @guest.update(place_params)
        format.html { redirect_to @guest, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @guest }
      else
        format.html { render :edit }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    @guest.destroy
    respond_to do |format|
      format.html { redirect_to guests_path, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def acuse
    
  end

  private
    def set_guest
      @guest = Guest.find(params[:id])
    end

    def guest_params
      params.require(:guest).permit(:name, :age, :ocupation)
    end
end

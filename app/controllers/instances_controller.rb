class InstancesController < ApplicationController

  before_filter :authenticate_admin!, only: [:index_admin]
  before_filter :authenticate_user!
  before_filter :self!, only: [:edit, :destroy]
  before_action :set_instance, only: [:show, :edit, :update, :destroy]
  before_action :set_weapon, only: [:create]
  before_action :set_place, only: [:create]
  before_action :set_guest, only: [:create]
  before_action :set_detective, only: [:create]
  
  def index
    @instances = Instance.all
  end

  def index_admin
    @instances = Instance.all
  end

  def new
    @instance = Instance.new
  end

  def create
    @instance = Instance.new(place_params)

    @guest.victim = true
    @instance.guests << @guest
    @instance.weapons<<@weapon
    @instance.places<<@place
    @instance.detective = @detective
 
    respond_to do |format|
      if @instance.save
        format.html { redirect_to [current_detective, @instance], notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @instance }
      else
        format.html { render :new }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update

    respond_to do |format|
      if @instance.update(place_params)
        format.html { redirect_to detective_instance_path(@instance.detective.id, @instance), notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @instance }
      else
        format.html { render :edit }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @guests = Guest.where(instance_id: nil)
  end

  def destroy
    g = @instance.guests.victim?
    g.victim = false
    g.save

    @instance.destroy
    respond_to do |format|
      format.html { redirect_to detective_instances_path, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def close
    instance = Instance.find(params[:id])
    state = !instance.state
    instance.update_attributes(:state => state)
    instance.date_close = Time.zone.now
    instance.save
    redirect_to detective_instances_path(instance.detective.id)
  end

  def acuse
    guest = Guest.find(params[:guests])
    guest.update_attributes(:instance_id => params[:id], :suspect => params[:suspect])
    redirect_to detective_instances_path(current_detective.id)
  end

  private
    def set_instance
      @instance = Instance.find(params[:id])
    end

    def set_detective
      @detective = Detective.find(params[:detective_id])
    end

    def place_params
      params.require(:instance).permit(:name, :victim, :place, :description, :date, :status, :detective_id)
    end

    def set_weapon
      @weapon = Weapon.find(params[:instance][:weapons])
    end

    def set_place
      @place = Place.find(params[:instance][:places])
    end

    def set_guest
      @guest = Guest.find(params[:instance][:guests])
    end
end

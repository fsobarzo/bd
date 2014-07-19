class InstancesController < ApplicationController

  before_action :set_instance, only: [:show, :edit, :update, :destroy]
  before_action :set_detective, only: [:create]
  
  def index
    @instances = Instance.all
  end

  def new
    @instance = Instance.new
  end

  def create
    @instance = Instance.new(place_params)
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
        format.html { redirect_to detective_instance_path(current_detective, @instance), notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @instance }
      else
        format.html { render :edit }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    @instance.destroy
    respond_to do |format|
      format.html { redirect_to detective_instances_path, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_instance
      @instance = Instance.find(params[:id])
    end

    def set_detective
      @detective = Detective.find(params[:detective_id])
    end

    def place_params
      params.require(:instance).permit(:name, :victim, :place, :description, :date, :detective_id)
    end
end

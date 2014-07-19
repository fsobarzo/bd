class InstancesController < ApplicationController

  before_action :set_instance, only: ["show"]
  
  def index
    @instances = Instance.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private
    def set_instance
      @instance = Instance.find(params[:id])
    end
end

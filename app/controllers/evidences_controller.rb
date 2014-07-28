class EvidencesController < ApplicationController
  def new
    @evidence = Evidence.new
    @instance = Instance.find(params[:instance_id])
  end

  def create
    @evidence = Evidence.new(evidence_params)
    @instance = Instance.find(params[:instance_id])
    @evidence.instance_id = @instance.id

    respond_to do |format|
      if @evidence.save
        format.html { redirect_to detective_instance_path(current_detective, @instance), notice: 'Evidence was successfully created.' }
        format.json { render :show, status: :created, location: @evidence }
      else
        format.html { render :new }
        format.json { render json: @evidence.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def evidence_params
      params.require(:evidence).permit(:description,:instance_id)
    end
end

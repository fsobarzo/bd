class NotesController < ApplicationController
  def new
  	@notes = Note.new
    @instance = Instance.find(params[:instance_id])
  end

  def create
  	@note = Note.new(note_params)
    @instance = Instance.find(params[:instance_id])
    @note.instance_id = @instance.id

    respond_to do |format|
      if @note.save
        format.html { redirect_to detective_instance_path(current_detective, @instance), notice: 'Evidence was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

   private
    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:description,:instance_id)
    end
end

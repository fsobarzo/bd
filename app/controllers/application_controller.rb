class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  	def authenticate_user!
  		(redirect_to root_path, flash: {error: "Debes ingresar al sistema"}) unless detective_signed_in? or admin_signed_in?
  	end

  	def self!
  		if !current_detective.nil?
  			if current_detective.id.to_i != params[:detective_id].to_i
  				redirect_to root_path, flash: {error: "No puedes acceder a este caso."}
  			end
  		end
  	end
end

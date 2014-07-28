class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  private

  	def authenticate_user!
  		(redirect_to root_path, flash: {error: "Debes ingresar al sistema"}) unless detective_signed_in? or admin_signed_in?
  	end

  	def self!
  		if !current_detective.nil?
  			if current_detective.id.to_i != params[:detective_id].to_i
  				redirect_to detective_instances_path(current_detective.id) , flash: {error: "No puedes acceder a este caso."}
  			end
  		end
  	end

  protected

  def configure_devise_permitted_parameters
    registration_params = [:name, :lastname, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end
end

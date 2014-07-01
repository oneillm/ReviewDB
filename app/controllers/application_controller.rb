class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
#  session :session_key => 'new_maintenance_admin'
  helper_method :newadmin?
  protected
def configure_permitted_parameters
   registration_params =[:username, :password, :password_confirmation,  :username, :email, :firstname, :lastname, :role, :phone,:status]
   if params[:action] == 'update'
        devise_parameter_sanitizer.for(:account_update){
           |u| u.permit(registration_params << :current_password)
        }
   elsif params[:action] == 'create'
        devise_parameter_sanitizer.for(:sign_up) {
           |u| u.permit(registration_params)
        }
   end
end
def authorize
   unless newadmin?
     flash[:error] = "unauthorized access"
     redirect_to home_path
     false
   end
end

def newadmin?
  session[:password]== "starter"
end

end

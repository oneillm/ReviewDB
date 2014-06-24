class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
#  session :session_key => 'new_maintenance_admin'
  helper_method :newadmin?
  protected
def configure_permitted_parameters
 devise_parameter_sanitizer.for(:sign_up) { |u| u.permit! }
 devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :password)}
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

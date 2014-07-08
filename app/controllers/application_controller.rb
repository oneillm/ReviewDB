class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
 before_filter {|controller| controller.instance_variable_set(:@authorized, true) if controller.devise_controller?}
   before_action :configure_permitted_parameters, if: :devise_controller? || :logins_controller?
   protect_from_forgery
   rescue_from CanCan::AccessDenied do |exception|
      flash[:error] = exception.message
      redirect_to root_url
   end
  alias_method :current_user, :current_login
  add_flash_types :success, :info, :warning, :danger
#  session :session_key => 'new_maintenance_admin'
#  helper_method :newadmin?
  protected
def configure_permitted_parameters
   registration_params =[:password, :password_confirmation,  :username, :email, :firstname, :lastname, :role, :phone,:status]
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


end

class SessionsController < ApplicationController
  before_filter {|controller| controller.instance_variable_set(:@authorized, true) if controller.devise_controller?}
   def create
      session[:password] = params[:password]
      flash[:notice] = 'Successfully signed up'
      redirect_to login_path
   end

   def destroy
      reset_session
      flash[:notice] = 'Successfully signed out'
      redirect_to home_path
   end
end 

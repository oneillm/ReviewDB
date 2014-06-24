class SessionsController < ApplicationController
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

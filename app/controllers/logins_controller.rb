class LoginsController < ApplicationController
  load_and_authorize_resource
  #before_filter :authenticate_login!
 before_action :set_login, only: [:show, :edit, :update, :destroy]  
  def index
      session[:login_page]=request.env['HTTP_REFERER'] || logins_url
     @logins = Login.without_login(current_login)
  end
  
  def new
    @login = Login.new
  end
  
  def create
    @login = Login.new(login_params)
    if @login.save
      flash[:notice] = "Successfully created User." 
#      redirect_to root_path
       redirect_to session[:login_page]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @login = Login.find(params[:id])
  end
  
  def update
   respond_to do |format|
      if @login.update(login_params)
        format.html { redirect_to @login, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @login = Login.find(params[:id])
    if @login.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to session[login_page]
    end
  end
  private
  def set_login
      session[:login_page]=request.env['HTTP_REFERER'] || logins_url
      @login = Login.find(params[:id])

  end
  def login_params
      params.require(:login).permit(:id, :firstname,:email, :lastname, :username,:phone,:password,:password_confirmation, :role, :status )
    end
end

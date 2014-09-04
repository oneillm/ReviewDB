class LoginsController < ApplicationController
  load_and_authorize_resource
  #before_filter :authenticate_login!
  # before_filter {|controller| controller.instance_variable_set(:@authorized, true) if controller.devise_controller?}
 before_action :set_login, only: [:show, :edit, :update, :destroy]  
  def index
      session[:login_page]=request.env['HTTP_REFERER'] || logins_url
      userlogins = Login.search(params[:search])
      @logins = Kaminari.paginate_array(userlogins).page(params[:page]).per(4)
      #@logins = Login.without_login(current_login).order("username").page(params[:page]).per(4)
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
         if @login == current_login
            format.html { redirect_to root_url, notice: 'Profile was sucessfully updated.' }
            
         else
            format.html { redirect_to @login, notice: 'User was successfully updated.' }
         end 
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
      redirect_to session[:login_page]
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

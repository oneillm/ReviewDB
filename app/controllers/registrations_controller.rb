class RegistrationsController < Devise::RegistrationsController 
  load_and_authorize_resource


  def create
    build_resource
    resource.role = "user"

    if resource.save
      if resource.active?
        set_flash_message :notice, :signed_up
        sign_in_and_redirect(resource_name, resource)
      else
        set_flash_message :notice, :inactive_signed_up, :reason => resource.inactive_message.to_s
        expire_session_data_after_sign_in!
        redirect_to after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords(resource)
      render_with_scope :new
    end
  end

  def token
    #@user = User.where(:id => params[:user_id]).first
    #@user.reset_authentication_token!
    redirect_to edit_login_registration_path(@login)
  end

  def update
   respond_to do |format|
      if @login.update(login_params)
        format.html { redirect_to @login, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html {redirect_to edit_login_registration_path(@login) }
        format.json { render json: @login.errors, status: :unprocessable_entity }
      end
    end
  end

  end
  private
  def set_login
     @login = current_login

  end
  def login_params
      params.require(:login).permit(:id, :firstname,:email, :lastname, :username,:phone,:password,:password_confirmation, :role, :status)
    end
end



end

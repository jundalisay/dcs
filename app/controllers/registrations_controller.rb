class RegistrationsController < Devise::RegistrationsController
  # This controller gives permissions and redirects  
  # prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.
  before_filter :configure_permitted_parameters
  protected

  def configure_permitted_parameters
    # these are for the signup and login
    devise_parameter_sanitizer.permit(:sign_up, 
      keys: [:username, :email, :password, :password_confirmation])
  end


  def destroy  
    resource.soft_delete
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)  
    set_flash_message :notice, :destroyed if is_flashing_format?  
    yield resource if block_given?  
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }  
  end

end
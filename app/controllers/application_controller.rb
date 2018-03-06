class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters,
                if: :devise_controller?
    
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age])
  end

  def after_sign_out_path_for resource
    root_path
  end 
     
  def after_sign_in_path_for(resource)
    @user = current_user
    if @user.sign_in_count == 1
    #mypage_enter_path
    user_root_path
    else          
      user_root_path
    end
  end


end
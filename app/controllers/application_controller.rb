class ApplicationController < ActionController::Base
 before_action :authenticate_user!, except: [:top]
 before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(@user)
  end

 def after_sign_out_path_for(resource)
    root_path
  end

 def create
    @user=User.new(user_params)
    @user.save
     flash[:notice] = "Signed out successfully."
    redirect_to root_path(user.id)
 end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

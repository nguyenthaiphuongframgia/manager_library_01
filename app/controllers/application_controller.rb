class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name, :phone]
    devise_parameter_sanitizer.permit :edit, keys: [:name, :phone]
  end

  def correct_user
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:danger] = t "users.user_not_found"
      redirect_to root_url
    else
      unless @user == current_user
        flash[:danger] = t "users.user_not_found"
        redirect_to root_url
      end
    end
  end

  def verify_admin
    unless current_user.admin? || current_user.manager?
      flash[:danger] = t "admin.users.you_allow"
      redirect_to request.referer
    end
  end
end

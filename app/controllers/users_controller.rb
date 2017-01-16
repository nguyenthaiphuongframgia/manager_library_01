class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :load_user, only: [:show]

  def index
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".profile_success"
    else
      flash[:danger] = t ".profile_fails"
    end
    redirect_to request.referer
  end

  private
  def user_params
    params.require(:user).permit :name, :phone, :email, :password,
      :password_confirmation, :avatar
  end

  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t ".user_not_found"
      redirect_to request.referer
    end
  end
end

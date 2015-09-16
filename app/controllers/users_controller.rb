class UsersController < ApplicationController
include SessionsHelper


  def index
  @users = User.all
  end

  def log_in

  end

  def profile
    authenticate!
    @user = current_user
  end
  def new
   @user = User.new
  end

  def create
    user = User.create(user_params)
    redirect_to '/log_in'
  end

  def edit
    authenticate!
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to '/users/profile'
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email, :pic_url, :bio, :token)
  end

end

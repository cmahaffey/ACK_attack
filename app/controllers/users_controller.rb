class UsersController < ApplicationController
include SessionsHelper


  def index

  end

  def log_in

  end



  def new
   @user = User.new
  end

  def create
    user = User.create(user_params)
    redirect_to '/'
  end



  private
  def user_params
    params.require(:user).permit(:username, :password, :email, :pic_url)
  end

end

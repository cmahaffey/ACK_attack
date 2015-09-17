class UsersController < ApplicationController
include SessionsHelper


  def index
  @users = User.all.shuffle
  end

  def log_in

  end

  def profile
    authenticate!
    @user = current_user
    @movie=Movie.where(movie_params)||nil
  end



  def new
   @user = User.new
  end

  def search

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

  def destroy
    user = User.find(params[:id])
    user.delete()
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email, :pic_url, :bio, :token, :location)
  end

  def movie_params
    # params[:name]="A Escrava Isaura"
    params.permit(:name)


  end





end

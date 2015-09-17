class UsersController < ApplicationController
include SessionsHelper


  def index
  @user = current_user
  @users = User.all.shuffle
  @favorites = Favorite.all
  end

  def log_in

  end

  def profile
    authenticate!
    @user = current_user
    @movie = Movie.where(movie_params)||nil
    @songs = Song.all
    @favorites = Favorite.where("user_id = ?", @current_user.id)
  end


  def new
   @user = User.new
  end

  def search
    @user = current_user
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

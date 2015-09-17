class FavoritesController < ApplicationController

  def create
    @favorites = Favorite.create(fav_params)
    redirect_to '/users/profile'
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.delete()
    redirect_to '/users/profile'
  end

  private
  def fav_params
    params.require(:favorite).permit(:user_id, :song_id, :spotify_url)
  end

end

class FavoritesController < ApplicationController

  def create
    @favorites = Favorite.create(params[:favorites])
    redirect '/profile'
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.delete()
    redirect '/profile'
  end

end

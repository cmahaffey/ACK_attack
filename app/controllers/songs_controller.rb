class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def movie_params
    # params[:name]="A Escrava Isaura"
    params.permit(:name)

  end
end

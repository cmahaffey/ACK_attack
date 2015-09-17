class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def songsapi
  #render json:  Movie.joins(:songs)
  songs = "movies.name='Back to the Future'"
  render json: Song.joins(:movie).where(songs)
  #render json: Movie.joins("RIGHT JOIN ON songs.movie_id = movie.id")
  end

end

def movie_params
  # params[:name]="A Escrava Isaura"
  params.permit(:name)

end

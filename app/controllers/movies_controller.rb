
class MoviesController < ApplicationController

  def index

  end

  def api
    puts 'x'*30
    puts movie_params||"haha, you failed"
    puts 'x'*30
    render json: Movie.where("lower(name) = ?", params[:name].downcase)
  end

  def songsapi
    songs = "movies.name=#{movie_params}"
    puts params[:name]
    movies=Movie.where("lower(name) = ?", params[:name].downcase)

    songs=movies.map do |movie|
      movie.id
    end

    render json: Song.joins(:movie).where("movies.id = ?", songs[songs.length-1])
  end


  def show
    params[:id]=45
    render json: Song.where("movie_id = #{params[:movie_id]}")
  end

  private
  def movie_params
    params.permit(:name, :mname)
  end

end

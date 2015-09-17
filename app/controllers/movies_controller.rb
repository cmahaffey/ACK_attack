
class MoviesController < ApplicationController

  def index
  #@movies = Movie.all
     @movies = Movie.where("name = '101 Dates'")
     puts @movie
  end

  def api
    puts 'x'*30
    puts movie_params||"haha, you failed"
    #{name => :title}
    puts 'x'*30

    render json: Movie.where(movie_params)
    # @movie.each do |movie|
    #   @songs= Song.where("movie_id = #{movie.id}")
    # end

  end

  def

  def show
    # puts 'x'*30
    # puts movie_params||"haha, you failed"
    params[:id]=45
    # puts 'x'*30
    # @movie=Movie.where(movie_params)
    # @songs=Song.where("movie_id = #{params[:id]}")

    render json: Song.where("movie_id = #{params[:movie_id]}")
  end

  private
  def movie_params
    params[:name]="A Escrava Isaura"
    params.permit(:name)

  end

end

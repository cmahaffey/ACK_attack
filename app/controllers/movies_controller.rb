
class MoviesController < ApplicationController

  def index
  #@movies = Movie.all
     @movies = Movie.where("name = '101 Dates'")
     puts @movie
  end

  def api
    render json: Movie.all
  end

  def show

    puts 'x'*30
    puts movie_params||"haha, you failed"
    puts 'x'*30
    @movie=Movie.where(movie_params)
    redirect_to '/users/profile'
  end

  private
  def movie_params
    # params[:name]="A Escrava Isaura"
    params.permit(:name)

  end
end

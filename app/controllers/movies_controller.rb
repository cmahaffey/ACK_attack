
class MoviesController < ApplicationController

  def index
  @movies = Movie.all

  end

  def show
    puts 'x'*30
    puts movie_params||"haha, you failed"
    puts 'x'*30
    @movie=Movie.where(movie_params)
  end

  private
  def movie_params
    # params[:name]="A Escrava Isaura"
    params.permit(:name)

  end
end


class MoviesController < ApplicationController

  def index
  #@movies = Movie.all
     @movies = Movie.where("name = '101 Dates'")
     puts @movie
  end

  def show
<<<<<<< HEAD
    puts 'x'*30
    puts movie_params||"haha, you failed"
    puts 'x'*30
    @movie=Movie.where(movie_params)
=======
    
    @movie=Movie.where("name= 'A Escrava Isaura'")

>>>>>>> f554a8b7b9923bab5d7e2013cb1bb48f447e59cf
  end

  private
  def movie_params
    # params[:name]="A Escrava Isaura"
    params.permit(:name)

  end
end

class MoviesController < ApplicationController

  def index
  #@movies = Movie.all
     @movies = Movie.where("name = '101 Dates'")
     puts @movie
  end

end

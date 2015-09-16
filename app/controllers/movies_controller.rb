require "json"
class MoviesController < ApplicationController

  def index
  @movies = Movie.all

  end

  def show
    @movie=Movie.where("name= 'A Escrava Isaura'")

  end

end

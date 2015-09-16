class MoviesController < ApplicationController

  def index
  @movies = Movie.all

  end

  def create
    @movie=Movie.find('Frozen')||nil
  end

end


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

    render json: Movie.where("lower(name) = ?", params[:name].downcase)
    # @movie.each do |movie|
    #   @songs= Song.where("movie_id = #{movie.id}")
    # end

  end


  def songsapi
# <<<<<<< HEAD

  songs = "movies.name=#{movie_params}"
  puts params[:name]
  movies=Movie.where("lower(name) = ?", params[:name].downcase)
  songs=movies.map do |movie|
    movie.id
  end
  render json: Song.joins(:movie).where("movies.id = ?", songs[songs.length-1])

# =======
#   #render json:  Movie.joins(:songs)
#   songs = "movies.name='#{params[:name]}'"
#   render json: Song.joins(:movie).where(songs)
#   #render json: Movie.joins("RIGHT JOIN ON songs.movie_id = movie.id")
# >>>>>>> 18bacc106097bcfc76cb5b8cd722bd5b78288222
  end


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

    params.permit(:name, :mname)

  end

end

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

require 'iconv'
file_raw = File.read('./lib/assets/soundtracks.list')

ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
file = ic.iconv(file_raw)
counter = 0
if file
  data = []
    a=[]
  file.split(/\n\n/).each do |film|

    if counter <= 3000
      if film && found = film.scan( /# .+/ )
        line = found[0]
        if line

          if line.scan( /\{(.*?)\}/).empty?#filters by tv series
            soundtrack_info = []
            artists = film.scan( /Performed by '(.*?)'/ )
            songs = film.scan( /- "(.*?)"/ )


            # index = 0
            # songs.each do |song|
            #   # unless artists[index]==nil
            #   #   artists[index]=artists[index][0].gsub("\"","")
            #   # else
            #   #   artists[index]="N/A"
            #   # end
            #   # unless film.scan( /- "(.*?)"/ )[index]==nil
            #   #   song= film.scan( /- "(.*?)"/ )[index][0].gsub("\"","")
            #   # end
            #   # if film.scan( /Performed by '(.*?)'/ )[index]==nil
            #   #   artist= nil
            #   # else
            #   #   artist= film.scan( /Performed by '(.*?)'/ )[index][0].gsub("\"","")
            #   # end
            #   # soundtrack_info.push({
            #   #   song: song,
            #   #   artist: artist
            #   #   #[0].gsub("\"","") || nil,
            #   #   })
            #   #   index +=1
            # end

              unless line[0..2]=="\# \""
                if line[0..2]=="\# A"
                  if film.scan( /Performed by '(.*?)'/ ).empty?
                    artist=nil
                  else
                    artist= film.scan( /Performed by '(.*?)'/ )[0][0].gsub("\"","")
                  end
                  unless film.scan( /- "(.*?)"/ ).empty?
                    song= film.scan( /- "(.*?)"/ )[0][0].gsub("\"","")

                  end
                  data.push({
                    title: line.scan( /# (.*?) \(/ )[0][0].gsub("\"",""),
                    year: line.scan( /\((.*?)\)/ )[0][0],
                    song_info: {
                      song: song,
                      artist: artist
                    }
                  })
                  counter+=1
                end
              end


          end #if end
        end
      end
    else
      break
    end # end of counter
  end
end

namespace :db do
  desc "load IMDB's movie soundtrack data"
  task :load_movies do
    require './app/models/movie'
    require './app/models/song'

    data.each do |datum|
      m=Movie.create({
          name: datum[:title],
          year:  datum[:year]
        })
      datum[:song_info].each do |song|
        i=0
        while i<song.length
        Song.create({
          name: song,
          artist: song,
          movie_id: m.id
          })
      end
    end
  end

  # desc "seed Users"
  # task :seed_users do
  #   require './app/models/users'
  #
  #   User.create({
  #     name:
  #     })
  # end
end

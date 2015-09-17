# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require './app/models/movie'
require './app/models/song'

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



     if counter <= 10000
      if film && found = film.scan( /# .+/ )
        line = found[0]
        if line

          if line.scan( /\{(.*?)\}/).empty?#filters by tv series
            soundtrack_info = []
            artists = film.scan( /Performed by '(.*?)'/ )
            songs = film.scan( /- "(.*?)"/ )


            index = 0
            songs.each do |song|
              unless artists[index]==nil
                artists[index]=artists[index][0].gsub("\"","")
              end
              soundtrack_info.push({
                artist: artists[index] || nil,
                song: song[0].gsub("\"","") || nil,
                })
                index +=1
            end

              unless line[0..2]=="\# \""
                if line[0..3]=="\# Al"
                  data.push({
                    title: line.scan( /# (.*?) \(/ )[0][0].gsub("\"",""),
                    year: line.scan( /\((.*?)\)/ )[0][0],

                    song_info: soundtrack_info
                  })
                  counter += 1
                elsif line[0..5]=="\# Rush"
                  data.push({
                    title: line.scan( /# (.*?) \(/ )[0][0].gsub("\"",""),
                    year: line.scan( /\((.*?)\)/ )[0][0],

                    song_info: soundtrack_info
                  })
                  counter += 1
                elsif line[0..4]=="\# Fro"
                  data.push({
                    title: line.scan( /# (.*?) \(/ )[0][0].gsub("\"",""),
                    year: line.scan( /\((.*?)\)/ )[0][0],

                    song_info: soundtrack_info
                  })
                  counter += 1
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


    data.each do |datum|
      m=Movie.create({
          name: datum[:title],
          year:  datum[:year]
        })
      datum[:song_info].each do |song|
        Song.create({
          name: song[:song],
          artist: song[:artist],
          movie_id: m.id
          })
      end
    end
  end
end

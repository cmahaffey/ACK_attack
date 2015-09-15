require 'json'
require 'iconv'
require 'byebug'
file_raw = File.read('./soundtracks.list')

ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
file = ic.iconv(file_raw)

if file
  data = file.split(/\n\n/).map do |film|
    if film && found = film.scan( /# .+/ )
      line = found[0]
      if line
        # unless line.scan( /\{(.*?)\}/ )[0]
          data={
            #i=some number to stand in for movie_id
            title: line.scan( /# "(.*?)"/ )[0]
                    line.scan( /# "(.*?)"/ )[0]
                   elsif line.scan( /# (.*?)/ )[0]
                    line.scan( /# (.*?)/ )[0]#=  [""]
                   end,
            year: line.scan( /\((.*?)\)/ )[0],

            # artist: line.scan( /{(.*?)}/ )[0],
            songs: film.scan( /- "(.*?)"/ ),
            artists: film.scan( /Performed by '(.*?)'/ )

          }


          data = {


          }

        # end
      end
    end
  end
  data.uniq!
end
  data.shift

File.write('imdb_data.js', data.to_json)

#rails g migration createMovies
# bin/rake db:create_migration NAME=create_movies
# bin/rake db:create_migration NAME=create_songs

Movie.create({title: line.scan, year: line.scan})

Song.create({artist: film.scan, title: film.scan})

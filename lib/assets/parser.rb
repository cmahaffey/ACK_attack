require 'json'
require 'iconv'
file_raw = File.read('./soundtracks.list')

ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
file = ic.iconv(file_raw)
counter = 0
if file
  data = []
    a=[]
  file.split(/\n\n/).each do |film|

    if counter <= 500
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
                # movie_id: counter
                })
                index +=1
            end


            data.push({
              title: line.scan( /# "(.*?)"/ )[0][0].gsub("\"",""),
              year: line.scan( /\((.*?)\)/ )[0][0].gsub("\"",""),
              # artist: line.scan( /{(.*?)}/ )[0],
              # artist: film.scan( /Performed by '(.*?)'/ ),
              # songs: film.scan( /- "(.*?)"/ )
              song_info: soundtrack_info
            })

            counter += 1
          end #if end
        end
      end
    else
      break
    end # end of counter
  end
end
puts data.length
# data.each do |datum|
#   m=Movie.create(name: datum[:title], year:  datum[:year])
#   Song.create(name: datum[:song_info][:song], artist: datum[:song_info][:artist] , movie_id:m.id)
# end



File.write('data.json', data.to_json)

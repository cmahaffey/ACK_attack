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
        data={
          title: line.scan( /# "(.*?)"/ )[0],
          year: line.scan( /\((.*?)\)/ )[0],
          tv:
          if line.scan( /\{(.*?)\}/ )[0]
            true
          else
            false
          end,
          # artist: line.scan( /{(.*?)}/ )[0],
          songs: film.scan( /- "(.*?)"/ ),
          artists: film.scan( /Performed by '(.*?)'/ )

        }

      end
    end
  end
  data.uniq
end

File.write('imdb_data.json', data.to_json)

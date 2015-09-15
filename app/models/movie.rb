class Movie < ActiveRecord::Base
  has_many :songs
end

class AddSpotifyUrlToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :spotify_url, :string
  end
end

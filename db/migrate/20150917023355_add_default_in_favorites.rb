class AddDefaultInFavorites < ActiveRecord::Migration
  def change
    change_column :favorites, :favorited, :boolean, default: false
  end
end

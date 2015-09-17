class UpdateFavoritedDefault < ActiveRecord::Migration
  def change
    change_column :favorites, :favorited, :boolean, default: true
  end
end

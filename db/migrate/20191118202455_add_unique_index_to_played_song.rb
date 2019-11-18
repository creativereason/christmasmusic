class AddUniqueIndexToPlayedSong < ActiveRecord::Migration[5.1]
  def change
    add_index :played_songs, [:title, :artist, :playtime], unique: true
  end
end

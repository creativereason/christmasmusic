class CreatePlayedSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :played_songs do |t|
      t.string :title
      t.string :artist
      t.datetime :playtime

      t.timestamps
    end
  end
end

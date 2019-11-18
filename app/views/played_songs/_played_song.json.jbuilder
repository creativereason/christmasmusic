json.extract! played_song, :id, :title, :artist, :playtime, :created_at, :updated_at
json.url played_song_url(played_song, format: :json)

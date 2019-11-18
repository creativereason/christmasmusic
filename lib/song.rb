class Song 
  attr_reader :name, :artist, :playtime, :id
  @@number_of_songs = 0 
  def initialize(name, artist, playtime)
    @name = name
    @artist = artist
    @playtime = playtime
    @@number_of_songs += 1
  end

  def song_number 
    return @@number_of_songs
  end

  def to_s 
    puts "song " + @name + ' by ' + @artist + ' was played at ' + @playtime
  end
end


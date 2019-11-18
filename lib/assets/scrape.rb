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



require 'open-uri'
require 'nokogiri'

url = 'https://www.radio.com/kezk/listen#recently-played'
html = open(url)

doc = Nokogiri::HTML(html)
songs = []
#collect all the songs played during this last hour...
doc.css('div.station-recently-played__show').each do |song_detail|
  song = song_detail.css('div.details__title').text
  artist = song_detail.css('div.details__artist').text
  playtime = song_detail.css('userlocal[data-date]').text
  song = Song.new(song, artist, playtime)
  songs.push(song) unless songs.include?(song)
end

songs.uniq{|c| [c.name, c.artist, c.playtime]}.each do |song|
  #now let's check databases and add if they don't exist. 
  unless PlayedSong.where(:title => song.name, :artist => song.artist, :playtime => song.playtime).exists? 
    ps = PlayedSong.create(title: song.name, artist: song.artist, playtime: song.playtime)
    puts ps.id
  end
  puts song.to_s
end


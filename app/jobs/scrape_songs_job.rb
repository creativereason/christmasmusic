require 'open-uri'
require 'nokogiri'

class ScrapeSongsJob 

  ## method to go scrape playlist.
  def run_job 
    scrapePlaylist
  end

  def self.run
    job = ScrapeSongsJob.new
    job.run_job
  end
 
  def scrapePlaylist

    url = 'https://www.radio.com/kezk/listen#recently-played'
    html = open(url)

    doc = Nokogiri::HTML(html)
    songs = []
    #collect all the songs played during this last hour...
    field = nil
    doc.css('div.station-recently-played__show').each do |song_detail|

      song = song_detail.css('div.details__title').text
      artist = song_detail.css('div.details__artist').text
      playtime = song_detail.css('userlocal[data-date]')
      unless playtime.blank?
        field = playtime[0]["data-date"].to_datetime
        field = field.change(:sec => 0)
        song = Song.new(song, artist, field.to_s)
        songs.push(song) unless songs.include?(song)
      end
    end

    songs.uniq{|c| [c.name, c.artist, c.playtime]}.each do |song|
      #now let's check databases and add if they don't exist. 
      puts song.to_s

      unless PlayedSong.where(:title => song.name, :artist => song.artist, :playtime => song.playtime).exists? 
        ps = PlayedSong.create(title: song.name, artist: song.artist, playtime: song.playtime)
        puts ps.id
      end
    end

  end
end

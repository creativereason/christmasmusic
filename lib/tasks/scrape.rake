namespace :scrape do
  desc "Scrape the radio.com list"
  task scrape: :environment do
    puts 'Attempting to import songs'
    count = PlayedSong.all.count
    puts "Current song count in database is: #{count}"
    ScrapeSongsJob.run
    count = PlayedSong.all.count
    puts "After update song count in database is: #{count}"
  end

end

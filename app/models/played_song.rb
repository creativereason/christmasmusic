class PlayedSong < ApplicationRecord
  validates :title, uniqueness: {scope: [:artist, :playtime]}
  validate :artist
  validate :playtime

  def to_s
    "#{title} by #{artist} was played at #{playtime}"
  end
end

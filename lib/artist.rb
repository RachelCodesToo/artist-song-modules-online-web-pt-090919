require 'pry'

class Artist
  extend Memorable::ClassMethods
  extend Findable::ClassMethods
  
  
  attr_reader :songs
  attr_accessor :name     

  @@artists = []

  def initialize
    self.class.all << self 
    @songs = []
  end

  def self.all
    @@artists
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  def to_param
    name.downcase.gsub(' ', '-')
  end
end

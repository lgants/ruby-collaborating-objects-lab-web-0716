class Artist
  attr_accessor :name, :songs
  attr_reader :names

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
   @songs << song
  end

  #accessor for class variable
  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_by_name(name)
    self.all.detect do |song_object|
      song_object.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) != nil ? self.find_by_name(name) : Artist.new(name)
  end

  def print_songs
    self.songs.each {|song| puts song.name}
  end
end

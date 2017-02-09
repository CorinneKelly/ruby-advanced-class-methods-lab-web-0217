require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name="default", artist="default")
  	@name = name
    @artist_name = artist
  end

  def self.create
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
  	new_song = Song.new(song_name)
  end

  def self.create_by_name(song_name)
    new_song = Song.new(song_name)
    new_song.save
    new_song
  end

  def self.new_by_name_and_artist(song_name, artist)
    new_song = Song.new(song_name, artist)
    # @artist_name = artist
  end

  def self.find_by_name(song_name)
    @@all.each do |song|
      return song if song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    return Song.new_by_name(song_name) unless @@all.include?(song_name)
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(file_name)
    array = file_name.split(/[-.]/)
    name = array[1].sub(" ", "")
    artist = array[0].delete(" ")
    self.new_by_name_and_artist(name, artist)

    # binding.pry
  end


  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

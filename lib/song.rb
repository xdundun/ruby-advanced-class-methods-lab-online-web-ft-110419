class Song
  attr_accessor :name, :artist_name
  @@all = []

    # def initialize(name)
    #   @name = name
    #   @@all << self
    # end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    return song
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if !find_by_name(name)
      create_by_name(name)
    else
      return find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name }
  end

  def self.new_from_filename(name)  # UPDATE WITH REGEX FOR SPLIT
    song = self.new
    artist = name.split(" - ")
    title = artist[1].split(".")
    song.artist_name = artist[0]
    song.name = title[0]
    return song
  end

  def self.create_from_filename(name) # UPDATE WITH REGEX FOR SPLIT
    song = self.new
    artist = name.split(" - ")
    title = artist[1].split(".")
    song.artist_name = artist[0]
    song.name = title[0]
    song.save
    return song
  end

  def self.destroy_all
    @@all.clear
  end

end #end of class

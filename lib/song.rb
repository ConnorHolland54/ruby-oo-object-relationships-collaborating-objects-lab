require 'pry'

class Song

    @@all = []

    attr_accessor :name, :artist

    def initialize(name)
        @name = name
        Song.all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        array = file.split(/[-.]/)
        song = Song.new(array[1].strip)
        song.artist_name = array[0].strip
        return song



        # song.artist.add_song(song)
        # binding.pry

    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        self.artist.add_song(self)
        # binding.pry
    end
end
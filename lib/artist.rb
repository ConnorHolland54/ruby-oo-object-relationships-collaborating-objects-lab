require 'pry'

class Artist
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
        @songs = []
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
        @songs << song
    end

    def self.find_or_create_by_name(name)
        artist = Artist.all.find {|artist| artist.name == name}
        if artist != nil 
            return artist
        else
            Artist.new(name)
            return Artist.all.find {|artist| artist.name == name}
        end
    end

    def print_songs
        songs.each do |song|
            puts(song.name)
        end
    end

end
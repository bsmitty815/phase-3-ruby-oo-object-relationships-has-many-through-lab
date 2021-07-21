
class Artist

    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_song(name, genre)
        #takes in two arguments, name and genre, and creates a new song. That song should know that it belongs to the artist
        Song.new(name, self, genre)
    end

    def songs
        #returns all songs associated with this Artist
        Song.all.select {|song| song.artist == self}
    end

    def genres
        #that iterates over that artist's songs and collects the genre of each song
        songs.map do |song|
            song.genre
        end
    end
end
require '../db/sqlrunner'
require_relative 'albums'

class Artist

    attr_accessor :name
    attr_reader :id


    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
    end

    def self.delete_all()
        sql = "DELETE FROM artists;"
        values = []
        SqlRunner.run(sql, "delete_all_artists", values)
    end

    def save
        sql = "INSERT INTO artists(name) VALUES($1) RETURNING *;"
        values = [@name]
        result = SqlRunner.run(sql, 'save_artist', values)
        @id = result[0]["id"].to_i
    end

    def self.all
        sql = "SELECT * FROM artists;"
        values = []
        artists = SqlRunner.run(sql, "select_all_artists", values)
        return artists.map{|artist| Artist.new(artist)}
    end

    def albums()
        sql = "SELECT * FROM albums WHERE artist_id = $1"
        values = [@id]
        album_hash = SqlRunner.run(sql, "find_albums", values)
        return album_hash.map{|album| Album.new(album)}
    end

    def update_artist
        sql = "UPDATE artists SET (name) = ($1) WHERE id = $2 "
        values = [@name, @id]
        SqlRunner.run(sql, "update_artist", values)
    end

end

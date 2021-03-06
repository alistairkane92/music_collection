require '../db/sqlrunner'
require_relative 'artists'

class Album

    attr_accessor :name, :genre, :artist_id
    attr_reader :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @genre = options['genre']
        @artist_id = options['artist_id'].to_i()
    end

    def self.delete_all()
        sql = "DELETE FROM albums;"
        values = []
        SqlRunner.run(sql, "delete_all_albums", values)
    end

    def save()
        sql = "INSERT INTO albums(name, genre, artist_id) VALUES($1,$2,$3) RETURNING *;"
        values = [@name, @genre, @artist_id]
        result = SqlRunner.run(sql, 'save_album', values)
        @id = result[0]["id"].to_i
    end

    def self.all()
        sql = "SELECT * FROM albums;"
        values = []
        albums = SqlRunner.run(sql, "list_of_albums", values)
        return albums.map{|album| Album.new(album)}
    end

    def artist()
        sql = "SELECT * FROM artists WHERE id = $1;"
        values = [@artist_id]
        artist_hash = SqlRunner.run(sql, "find_artist", values)
        artist_objects = artist_hash.map{|artist| Artist.new(artist)}
        return artist_objects
    end

    def update_album()
        sql = "UPDATE albums SET (name) = ($1) WHERE id = $2;"
        values = [@name, @id]
        SqlRunner.run(sql, "update_album", values)
    end

    def delete_album()
        sql = "DELETE FROM albums WHERE id = $1;"
        values = [@id]
        SqlRunner.run(sql, "delete_album", values)
    end
end

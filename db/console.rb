require("pry")
require_relative("../models/artists.rb")
require_relative("../models/albums.rb")


Artist.delete_all()

artist1 = Artist.new({"name" => 'Metallica'})

artist1.save()

artist2 = Artist.new({"name" => 'Queen'})

artist2.save()

album1 = Album.new({"name" => 'The Black Album', "genre" => "Metal", 1})

album1.save()

album2 = Album.new({"name" => "A Kind of Magic", "genre" => "Pop", 2})

album2.save()

binding.pry
nil

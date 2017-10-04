require("pry")
require_relative("../models/artists.rb")
require_relative("../models/albums.rb")

Album.delete_all()
Artist.delete_all()


artist1 = Artist.new({"name" => 'Metallica'})
artist2 = Artist.new({"name" => 'Queen'})

artist1.save()
artist2.save()

album1 = Album.new({"name" => 'The Black Album', "genre" => "Metal", "artist_id" => artist1.id})
album2 = Album.new({"name" => "A Kind of Magic", "genre" => "Pop", "artist_id" => artist2.id})

artist1.name = "Blur"
album1.name = "Country House"

artist1.update_artist
album1.update_album

album1.save()
album2.save()






binding.pry
nil

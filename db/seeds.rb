require 'open-uri'
require 'nokogiri'


User.create(email: 'a@a.a', password: 'password', admin: true)

file = open('db/videos.html').read
html_doc = Nokogiri::HTML(file)
array = []
html_doc.search('.video_manager__table_item').each do |element|
  attributes = element.search('.video_manager__table_cell--greedy').search('a').first.attributes
  name = attributes["title"].value
  url = "https://vimeo.com#{attributes["href"].value}"

  film = Film.new(name: name, video_url: url).set_attributes
  film.save
end


puts "Destroying all bookings & requests"
Request.destroy_all
Booking.destroy_all

puts "Creating 15 fake requests"
15.times do
  Request.create(email_address: Faker::Internet.email, name: Faker::Name.unique.name, date_wedding: Date.today + rand(100), subject: Faker::Hacker.say_something_smart , location_wedding: Faker::Address.street_address, state: ['pending', 'approved', 'quotation', 'first_contact', 'declined'].sample, phone_number: ("0".."10").to_a.shuffle.join(""))
end

puts "Creating 10 fake bookings"
10.times do
  booking = Booking.create(email_address: Faker::Internet.email, name: Faker::Name.unique.name, date_wedding: Date.today + rand(100), subject: Faker::Hacker.say_something_smart , location_wedding: Faker::Address.street_address, state: ['film', 'invoice', 'paid'].sample)
end

puts "Scraping 50 songs & Inserting into DB"


# Rustig
# The look of love – Diana Krall
Song.create(title: "The look of love", artist: "Diana Krall", spotify_uri: "spotify:track:18BItNMXs9uGTSTucXXBpJ", label: "slow")
# Just the way you are - Billy Joel
Song.create(title: "Just the way you are", artist: "Billy Joel", spotify_uri: "spotify:track:49MHCPzvMLXhRjDantBMVH", label: "slow")
# For once in my life- Frank Sinatra
Song.create(title: "For once in my life", artist: "Frank Sinatra", spotify_uri: "spotify:track:5YGHjJ8MZ58awD5VzwGmcS", label: "slow")

# I’m ready - Bryan Adems
Song.create(title: "I'm ready", artist: "Bryan Adems", spotify_uri: "spotify:track:0vUbniRewuDin7Tc7IHZtP", label: "slow")

# Look at me- Carrie Underwood
Song.create(title: "Look at me", artist: "Carrie Underwood", spotify_uri: "spotify:track:2Qjgj1yLs78G4pEVhy7myz", label: "slow")

# Hold me - Anouk & Douwe bob
Song.create(title: "Hold me", artist: "Anouk & Douwe Bob", spotify_uri: "spotify:track:3XEUBS8RkM7u8oNRAPFYxf", label: "slow")

# Eva Cassidy- field of gold
Song.create(title: "Fields of gold", artist: "Eva Cassidy", spotify_uri: "spotify:track:3ZCcM7shThOmbOhDuGkOZR", label: "slow")

# Over and over again - Nathan Sykes
Song.create(title: "Over and over Again", artist: "Nathan Sykes", spotify_uri: "spotify:track:2PuabCuixXyVBlCy2SOXiq", label: "slow")

# Meer tempo

Song.create(title: "L-O-V-E", artist: "Nat king cole", spotify_uri: "spotify:track:7E3rc13GL2I5wA6CIFXaxs", label: "mid")
# Lucky - Jason Mraz & Colbie Caillat

Song.create(title: "L-O-V-E", artist: "Joss Stone", spotify_uri: "spotify:track:4MymCsjbOkhuP2kWNSZgLo", label: "mid")


Song.create(title: "Can't take my eyes off you", artist: "Andy Willams & Denise van Outen", spotify_uri: "spotify:track:4SHZsQIdS2N1E5yqvoXF8o", label: "mid")

# Cant’t get enough of your love  – Barry white
Song.create(title: "Can't get enough of your love", artist: "Barry White", spotify_uri: "spotify:track:1RG0HipdMCcaW9xJjyKiUb", label: "mid")

# You to Me Are Everything - the real thing
Song.create(title: "You are my everything", artist: "The real thing", spotify_uri: "spotify:track:0vbjScjOnbC4QfgzYLYXrR", label: "mid")

#  -
Song.create(title: "Une belle histiore", artist: "Michel Fugain", spotify_uri: "spotify:track:1GdtMDRiaF1EnG2LJpELme", label: "mid")

# Paradise - Coldplay
Song.create(title: "Paradise", artist: "Coldplay", spotify_uri: "spotify:track:6nek1Nin9q48AVZcWs9e9D", label: "mid")

# Just say Yes- Snow Patrol
Song.create(title: "Just say Yes", artist: "Snow Patrol", spotify_uri: "spotify:track:4NjepGD2BJeOo4Ne3GkWue", label: "mid")

# Up tempo

Song.create(title: "Chained to the Rhythem", artist: "Katy Perry", spotify_uri: "spotify:track:6520aj0B4FSKGVuKNsOCOi", label: "up")

# Euphoria - Loreen
Song.create(title: "Euphoria", artist: "Loreen", spotify_uri: "spotify:track:1xN7BpTAWnZkuSLOtRP6Qc", label: "up")

# Ain’t nobody – Chaka Khan
Song.create(title: "Ain't Nobody", artist: "Chaka Khan", spotify_uri: "spotify:track:2NVpYQqdraEcQwqT7GhUkh", label: "up")


# Love never felt so good- Micheal Jackson

Song.create(title: "Love never felt so good", artist: "Michael Jackson", spotify_uri: "spotify:track:0S5EEpFAHcT7cm5XOASc29", label: "up")

# Hold my hand- Jess Glynne
Song.create(title: "Hold my hand", artist: "Jess Glynne", spotify_uri: "spotify:track:1i1rNVtxbE7rdFfpHuNq2j", label: "up")

# I feel it coming - The Weeknd

Song.create(title: "I feel it coming", artist: "The weeknd", spotify_uri: "spotify:track:4RepvCWqsP6zBuzvwYibAS", label: "up")

# Justin Timberlake-  Can’t stop the feeling
Song.create(title: "Can't stop the feeling", artist: "Justin Timberlake", spotify_uri: "spotify:track:6JV2JOEocMgcZxYSZelKcc", label: "up")

# Move on up- Curtis Mayfield
Song.create(title: "Move on up", artist: "Curtis Mayfield", spotify_uri: "spotify:track:1DxjLSO8tQHRzfgrZB8Ggi", label: "up")

# Blessed- Tom Hangs & Shermanology
Song.create(title: "Blessed", artist: "Tom Hangs & Shermanology", spotify_uri: "spotify:track:7oQZXgpYOAlBM80XIiSGPH", label: "up")

# Addicted to you - Avicii
Song.create(title: "Adicted to you", artist: "Avicii", spotify_uri: "spotify:track:0xIVvRmjztR1AwuHrkhH41", label: "up")

# Muziekkeuze 1

# 1.The look of love – Diana Krall
# 2.Paradise - Coldplay
# 3.When love takes over- David Guetta

# Muziekkeuze 2

# 1.For once in my life - Frank Sinatra
# 2.Une belle histiore - Michel Fugain
# 3.Ain’t nobody – Chaka Khan

# Muziekkeuze 3

# 1.I’m ready - Bryan Adems
# 2.Lucky - Jason Mraz & Colbie Caillat
# 3.Move on up- Curtis Mayfield

# Muziekkeuze 4

# 1.Pui che puoi, Eros whit Cher
# 2.You to Me Are Everything - the real thing
# 3.Euphoria - Loreen

# Muziekkeuze 5

# 1.Hold me- Anouk & Douwe Bob
# 2.You - Ten Sharp
# 3.Blessed- Tom Hangs & Shermanology

# Muziekkeuze 6

# 1.Perfect - Ed Sheeran whit Beyonce
# 2.Cant’t get enough of your love  – Barry white
# 3.Love never felt so good- Micheal Jackson

# Muziekkeuze 7

# 1.Over and over again - Nathan Sykes
# 2.Can’t take my eyes off you, Andy Willams & Denise van Outen
# 3.Addicted to you - Avicii

# Muziekkeuze 8

# 1.Just the way you are - Billy Joel
# 2.Just say Yes- Snow Patrol
# 3.You’r the first the last. my everything

# Muziekkeuze 9

# 1. Catch & Release- Matt Simons & Deepend
# 2.Come see the end in me, Elske Dewall
# 3.Sex on Fire- Kings of Leon

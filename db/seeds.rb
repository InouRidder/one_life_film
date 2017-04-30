# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Film.destroy_all


urls = ['https://vimeo.com/206687022','https://vimeo.com/206687022','https://vimeo.com/206687022','https://vimeo.com/206687022','https://vimeo.com/206687022','https://vimeo.com/206687022','https://vimeo.com/206687022','https://vimeo.com/206687022','https://vimeo.com/206687022','https://vimeo.com/206687022','https://vimeo.com/206687022','https://vimeo.com/206687022','https://vimeo.com/206687022','https://vimeo.com/206687022','https://vimeo.com/206687022']
urls.each do |url|
  Film.create(name: Faker::Book.title, video_url: url, password: nil, promo: true, poster: "https://unsplash.it/g/200/300")
end

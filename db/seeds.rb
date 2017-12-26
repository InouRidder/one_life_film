# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Film.destroy_all

# require 'pry'
# require 'open-uri'
# require 'nokogiri'

# file = open('db/videos.html').read
# html_doc = Nokogiri::HTML(file)
# array = []
# html_doc.search('.video_manager__table_item').each do |element|
#   attributes = element.search('.video_manager__table_cell--greedy').search('a').first.attributes
#   name = attributes["title"].value
#   url = "https://vimeo.com#{attributes["href"].value}"

#   film = Film.new(name: name, video_url: url).set_attributes
#   film.save
# end

10.times do
  Booking.create(email_address: Faker::Internet.email, name: Faker::Name.unique.name, date_wedding: Date.today + rand(100), subject: Faker::Hacker.say_something_smart , location_wedding: Faker::Address.street_address )
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'open-uri'

puts "Cleaning the Movie db and Bookmarks"
Bookmark.destroy_all
Movie.destroy_all
puts "Done! Now cleaning the List db"
List.destroy_all

puts "Now populating the Movie db"

url = "http://tmdb.lewagon.com/movie/top_rated"

20.times do |i|
  puts "Importing movies from page #{i + 1}"
    movies = JSON.parse(open("#{url}?page=#{i + 1}").read)['results']
    movies.each do |movie|
      puts "Creating #{movie['title']}"
      base_poster_url = "https://image.tmdb.org/t/p/original"
      Movie.create(
        title: movie['title'],
        overview: movie['overview'],
        poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
        rating: movie['vote_average']
      )
    end
end
puts "Movies are done! Now for lists..."

names = ["Save for later", "Recommended", "Interested", "Kid Friendly", "Background noise", "Movie Night"]

names.each do |name|
  List.create!(name: name)
end

puts "List is done! 🙂"

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'
require 'open-uri'
puts 'destroy all records'
Booking.destroy_all
Review.destroy_all
Book.destroy_all
User.destroy_all

puts 'create users'
10.times do
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email,
                password: "123456")
end

puts 'creating books'
10.times do
  Book.create(title: Faker::Book.title, author: Faker::Book.author, description: Faker::Quote.matz,
              condition: ['poor', 'used', 'damaged', 'good', 'very good', 'brand new'].sample, user: User.all.sample)
end

book_image_urls = ["https://res.cloudinary.com/dlmjemn37/image/upload/v1732206543/matthew-hamilton-SHMp_d0-SZg-unsplash_u6laao.jpg",
                    "https://res.cloudinary.com/dlmjemn37/image/upload/v1732206543/thought-catalog-B1dQCWz0U2w-unsplash_ygg84e.jpg",
                    "https://res.cloudinary.com/dlmjemn37/image/upload/v1732206542/lewis-pC_kzUrdxoY-unsplash_iixlth.jpg"]

Book.all.each do |book|
  image_file = URI.open(book_image_urls.sample)
  book.photo.attach(io: image_file, filename: "#{book.title}.jpg", content_type: "image/jpg")
end

puts 'create reviews'
40.times do
  Review.create(user: User.all.sample, book: Book.all.sample, content: Faker::Lorem.paragraph(sentence_count: 3))
end

p "created #{Book.count} Books"
p "created #{User.count} Users"
p "created #{Review.count} Reviews"

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

user_profile_picture_urls = ["https://res.cloudinary.com/dlmjemn37/image/upload/v1732269784/mona-magnussen-a7bdqjeG6M4-unsplash_s5siep.jpg",
                             "https://res.cloudinary.com/dlmjemn37/image/upload/v1732269783/recal-media-ueBIGLmiI5A-unsplash_gt7uuq.jpg",
                             "https://res.cloudinary.com/dlmjemn37/image/upload/v1732269783/joshua-rawson-harris-6PROVhY2Yq4-unsplash_coh53k.jpg",
                             "https://res.cloudinary.com/dlmjemn37/image/upload/v1732269781/ferr-studio-G2Qjx1y9aAM-unsplash_z0twnl.jpg",
                             "https://res.cloudinary.com/dlmjemn37/image/upload/v1732269781/taras-shypka-QEgHL8NN7nM-unsplash_dv1puq.jpg"]

book_image_urls = [ "https://res.cloudinary.com/dlmjemn37/image/upload/v1732206543/matthew-hamilton-SHMp_d0-SZg-unsplash_u6laao.jpg",
                    "https://res.cloudinary.com/dlmjemn37/image/upload/v1732206543/thought-catalog-B1dQCWz0U2w-unsplash_ygg84e.jpg",
                    "https://res.cloudinary.com/dlmjemn37/image/upload/v1732206542/lewis-pC_kzUrdxoY-unsplash_iixlth.jpg",
                    "https://res.cloudinary.com/dlmjemn37/image/upload/v1732268800/morgan-housel-aZ_MmSmAcjg-unsplash_rtbngj.jpg",
                    "https://res.cloudinary.com/dlmjemn37/image/upload/v1732268800/amol-srivastava-9484a2erPrQ-unsplash_xuy3ta.jpg",
                    "https://res.cloudinary.com/dlmjemn37/image/upload/v1732268801/elin-melaas-kBDBb88S0fE-unsplash_nqdrle.jpg",
                    "https://res.cloudinary.com/dlmjemn37/image/upload/v1732268801/rain-bennett-7Nir5-XIRVM-unsplash_rlfijj.jpg",
                    "https://res.cloudinary.com/dlmjemn37/image/upload/v1732269781/marvin-cheung-NlwKopccawA-unsplash_nwgtnc.jpg"]

Book.all.each do |book|
  image_file = URI.open(book_image_urls.sample)
  book.photo.attach(io: image_file, filename: "#{book.title}.jpg", content_type: "image/jpg")
end

User.all.each do |user|
  profile_image = URI.open(user_profile_picture_urls.sample)
  user.photo.attach(io: profile_image, filename: "#{user.first_name}.jpg", content_type: "image/jpg")
end

puts 'create reviews'
40.times do
  Review.create(user: User.all.sample, book: Book.all.sample, content: Faker::Lorem.paragraph(sentence_count: 3))
end

p "created #{Book.count} Books"
p "created #{User.count} Users"
p "created #{Review.count} Reviews"

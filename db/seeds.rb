# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Seed Listings
# Seed Listings

user = {}
user['password'] = 'asdf'
user['password_confirmation'] = 'asdf'

ActiveRecord::Base.transaction do
  20.times do 
    user['username'] = Faker::Name.first_name 
    user['email'] = Faker::Internet.email
    user['gender'] = rand(1..2)
    user['country'] = Faker::Address.country

    User.create(user)
  end
end 

listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do
    listing['name'] = Faker::App.name
    listing['home_type'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample

    listing['room_type'] = ["junior suite", "double small", "double medium", "double large", "double extra large"]
    listing['maximum_guests'] = rand(1..10)

    listing['adress'] = Faker::Address.street_address
	listing['place'] = ["kuala lumpur", "jakarta", "hong kong", "tokyo", "seoul", "kremlin", "paris", "maldives", "pyongyang", "hawaii", "istanbul"]
    
    listing['price'] = rand(80..500)
    listing['description'] = Faker::Hipster.sentence
    listing['availability_from'] = Faker::Date
    listing['availability_to'] = Faker::Date
    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end
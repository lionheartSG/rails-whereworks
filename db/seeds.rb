require "faker"

LISTING_CAT = ["Cafe", "Coworking Space", "Restaurant", "Residential"]
BOOKING_CAT = ["Table", "Room"]

# Seeding users and listings
puts "Cleaning up database..."
User.destroy_all
Listing.destroy_all

puts "Seeding database..."
10.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password"
  )
  puts "User created"
  # Create a random number (between 0-5) of seeds per user
  rand(5).times do
    Listing.create(
      name: Faker::Company.name,
      address: Faker::Address.street_address,
      listing_type: LISTING_CAT.sample,
      booking_type: BOOKING_CAT.sample,
      description: Faker::Company.catch_phrase,
      price: rand(2..20),
      user:
    )
    puts "Successfully created"
  end
end
puts "Finished!"

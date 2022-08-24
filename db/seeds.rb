require "faker"

LISTING_CAT = ["Cafe", "Coworking Space", "Restaurant", "Residential"]
BOOKING_CAT = ["Table", "Room"]
ZONE = ["North", "South", "East", "West", "Central"]
STATUS = ["Cancelled", "Completed", "Pending", "Active"]

# Seeding users, listings and bookings
puts "Cleaning up database..."
User.destroy_all
Listing.destroy_all
Booking.destroy_all

puts "Seeding database..."

# Create two set users
bob_user = User.create(
  first_name: "Bob",
  last_name: "Bobberson",
  email: "bob.bobberson@gmail.com",
  password: "password"
)

alex_user = User.create(
  first_name: "Alex",
  last_name: "Alexson",
  email: "alex.alexson@gmail.com",
  password: "password"
)

# create faker data
10.times do |index|
  # Generate 10 users
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "fake_email_#{index}@gmail.com",
    password: "password"
  )
  puts "User created"
  # Generate (0-5) listings per user
  rand(5).times do
    listing = Listing.create(
      name: Faker::Company.name,
      zone: ZONE.sample,
      address: Faker::Address.street_address,
      listing_type: LISTING_CAT.sample,
      booking_type: BOOKING_CAT.sample,
      description: Faker::Company.catch_phrase,
      price: rand(2..20),
      user:
    )
    puts "Listing created"
    # Generate (0-5) bookings per listing
    rand(5).times do
      Booking.create(
        reservation_startdatetime: Faker::Date.forward(days: 23),
        reservation_enddatetime: Faker::Date.forward(days: 23),
        quantity: rand(1..5),
        status: STATUS.sample,
        listing:,
        user:
      )
      puts "Booking created"
    end
  end
end
puts "Finished!"

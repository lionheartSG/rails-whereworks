require 'faker'

# LISTING_CAT = ["Cafe", "Coworking Space", "Restaurant", "Residential"]
# BOOKING_CAT = ["Table", "Room"]
# STATUS = ["Cancelled", "Completed", "Pending", "Active"]

# Seeding users, listings and bookings
puts 'Cleaning up database'
User.destroy_all
Listing.destroy_all
Booking.destroy_all

puts 'Seeding database'
user_bob = User.create(
  first_name: 'Bob',
  last_name: 'Bobberson',
  email: 'bob.bobberson@gmail.com',
  password: 'password'
)
puts 'Created user'

user_anna = User.create(
  first_name: 'Anna',
  last_name: 'Annason',
  email: 'anna.annason@gmail.com',
  password: 'password'
)
puts 'Created user'

user_yc = User.create(
  first_name: 'YC',
  last_name: 'Low',
  email: 'yc.low@gmail.com',
  password: 'password'
)
puts 'Created user'

user_alex = User.create(
  first_name: 'Alex',
  last_name: 'Alexson',
  email: 'alex.alexson@gmail.com',
  password: 'password'
)
puts 'Created user'

Listing.create(
  name: 'Workthere Singapore',
  address: '30 Cecil St, Singapore 049712',
  listing_type: 'Coworking Space',
  booking_type: 'Room',
  description: 'Be smart. Workthere. Workthere is the new way to find flexible workspace to help your business grow.',
  price: 15,
  user: user_alex
)
puts 'Created listing'

listing_workbuddy = Listing.create(
  name: 'workbuddy',
  address: '150 Beach Rd, Singapore 189720',
  listing_type: 'Coworking Space',
  booking_type: 'Room',
  description: 'Your fave coworking office in Singapore!',
  price: 15,
  user: user_alex
)
puts 'Created listing'

Booking.create(
  date: '29/08/22',
  start_time: '12:00 PM',
  end_time: '1:00 PM',
  quantity: rand(1..5),
  status: 'Cancelled',
  listing: listing_workbuddy,
  user: user_yc
)
puts 'Booking created'

user_mary = User.create(
  first_name: 'Mary',
  last_name: 'Maryson',
  email: 'mary.maryson@gmail.com',
  password: 'password'
)
puts 'Created user'

listing_sb_fu = Listing.create(
  name: 'Starbucks - Fusionopolis',
  address: '1 Fusionopolis Way, Singapore 138632',
  listing_type: 'Cafe',
  booking_type: 'Table',
  description: 'Multi-level Starbucks, great for remote work!',
  price: 10,
  user: user_mary
)
puts 'Created listing'

listing_sb_ma = Listing.create(
  name: 'Starbucks - Marina Square',
  address: '6 Raffles Blvd, Singapore 039594',
  listing_type: 'Cafe',
  booking_type: 'Table',
  description: 'Starbucks in the heart of the city!',
  price: 10,
  user: user_mary
)
puts 'Created listing'

Booking.create(
  date: '30/08/22',
  start_time: '11:00 AM',
  end_time: '1:00 PM',
  quantity: rand(1..5),
  status: 'Pending',
  listing: listing_sb_ma,
  user: user_bob
)
puts 'Booking created'

Booking.create(
  date: '01/09/22',
  start_time: '12:00 PM',
  end_time: '3:00 PM',
  quantity: rand(1..5),
  status: 'Active',
  listing: listing_sb_fu,
  user: user_anna
)
puts 'Booking created'

user_jim = User.create(
  first_name: 'Jim',
  last_name: 'Jimson',
  email: 'jim.jimson@gmail.com',
  password: 'password'
)
puts 'Created user'

Listing.create(
  name: 'WeWork',
  address: '83 Clemenceau Ave, Singapore 239920',
  listing_type: 'Coworking Space',
  booking_type: 'Table',
  description: 'Fancy coworking spot. Come and do some work.',
  price: 20,
  user: user_jim
)
puts 'Created listing'

Listing.create(
  name: 'WeWork',
  address: '60 Anson Rd, Singapore 079914',
  listing_type: 'Coworking Space',
  booking_type: 'Table',
  description: 'Fancy coworking spot. Come and do some work.',
  price: 20,
  user: user_jim
)
puts 'Created listing'

listing_wework_ra = Listing.create(
  name: 'WeWork',
  address: '30 Raffles Pl, Singapore 048622',
  listing_type: 'Coworking Space',
  booking_type: 'Table',
  description: 'Fancy coworking spot. Come and do some work.',
  price: 20,
  user: user_jim
)
puts 'Created listing'

Booking.create(
  date: '29/08/22',
  start_time: '12:00 PM',
  end_time: '1:00 PM',
  quantity: rand(1..5),
  status: 'Confirmed',
  listing: listing_wework_ra,
  user: user_anna
)
puts 'Booking created'

puts 'Finished!'

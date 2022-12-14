class Listing < ApplicationRecord
  LISTING_TYPES = ["Cafe", "Coworking Space", "Restaurant", "Residential"]
  BOOKING_TYPES = ["Table", "Room"]

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :listing_reviews, dependent: :destroy, through: :bookings
  has_many_attached :photos
  has_many :listing_reviews, dependent: :destroy, through: :bookings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # validates :name, :address, presence: true, length: { minimum: 2 }
  # validates :description, presence: true, length: { minimum: 2 }
  # validates :listing_type, presence: true, inclusion: { in: LISTING_TYPES }
  # validates :booking_type, presence: true, inclusion: { in: BOOKING_TYPES }
  # validates :zone, presence: true, inclusion: { in: ZONES }
  # validates :price, presence: true
end

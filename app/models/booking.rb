class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  has_one :listing_review
  has_one :user_review
  # validates :quantity, presence: true
  # validates :reservation_startdatetime, presence: true
  # validates :reservation_enddatetime, presence: true
end

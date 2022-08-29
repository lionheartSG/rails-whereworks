class UserReview < ApplicationRecord
  belongs_to :booking
  # scope :for, ->(user) { joins(:booking).where('bookings.user': user) }
end

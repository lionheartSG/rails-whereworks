class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  # validates :quantity, presence: true
  # validates :reservation_startdatetime, presence: true
  # validates :reservation_enddatetime, presence: true
end

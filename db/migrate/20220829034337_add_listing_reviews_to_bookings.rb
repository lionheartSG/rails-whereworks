class AddListingReviewsToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :listing_reviews, foreign_key: true
  end
end

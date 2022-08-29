class AddUserReviewsToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :user_reviews, foreign_key: true
  end
end

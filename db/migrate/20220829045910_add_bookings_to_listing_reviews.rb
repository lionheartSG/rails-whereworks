class AddBookingsToListingReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :listing_reviews, :listing_reviews, null: false, foreign_key: true
  end
end

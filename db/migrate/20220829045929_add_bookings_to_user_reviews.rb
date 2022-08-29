class AddBookingsToUserReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_reviews, :user_reviews, null: false, foreign_key: true
  end
end

class CreateListingReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :listing_reviews do |t|
      t.integer :listing_rating
      t.text :listing_comment

      t.timestamps
    end
  end
end

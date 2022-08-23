class CreateUserReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :user_reviews do |t|
      t.integer :user_rating
      t.text :user_comment

      t.timestamps
    end
  end
end

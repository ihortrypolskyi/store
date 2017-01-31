class AddReviewStatusToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :review_status, foreign_key: true
  end
end

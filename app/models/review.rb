class Review < ApplicationRecord
  belongs_to :user
  validates :rating, inclusion: (0..5)
  validates :comment, length: { maximum: 500 }
end

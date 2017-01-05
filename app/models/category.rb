class Category < ApplicationRecord
  has_many :book_categories
  has_many :book, through: :book_categories
  scope :sorted, -> { order(:position)}
end

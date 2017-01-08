class Book < ApplicationRecord
  has_many :book_categories
  has_many :categories, through: :book_categories
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :publishers
  validates :title, presence: true, length: { maximum: 200 }
  validates :description, presence: true, length: { maximum: 4000 }
  validates :price, presence: true, length: { in: 1..4 }
  validates :year, presence: true, length: { is: 4 }
  validates :isbn, length: { in: 10..13 }
end

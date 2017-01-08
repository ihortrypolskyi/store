class Book < ApplicationRecord
  has_many :book_categories
  has_many :categories, through: :book_categories
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :publishers
end

class Category < ApplicationRecord
  acts_as_list
  has_many :book_categories
  has_many :books, through: :book_categories
  scope :sorted, -> { order(:position)}
  validates :name, presence: true, length: { maximum: 200 }, uniqueness: {case_sensitive: false}
end

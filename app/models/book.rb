class Book < ApplicationRecord
  attr_accessor :avg_review

  has_many :book_categories
  has_many :categories, through: :book_categories
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :publishers
  has_many :reviews
  has_many :order_books

  validates :title, presence: true, length: { maximum: 200 }
  validates :description, presence: true, length: { maximum: 4000 }
  validates :price, presence: true, length: { in: 1..4 }
  validates :year, presence: true, length: { is: 4 }
  validates :pages, presence: true
  validates :language, presence: true


  mount_uploader :image, BookUploader

  def self.search(search)
    if search
      search_key = "%#{search}%"
      where("title LIKE ? OR description LIKE ?", search_key, search_key)
    else
      all
    end
  end
end


class Book < ApplicationRecord
  attr_accessor :avg_review
  searchkick word_start: [:title, :description]

  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks

  has_many :book_categories
  has_many :categories, through: :book_categories
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :publishers
  has_many :reviews
  validates :title, presence: true, length: { maximum: 200 }
  validates :description, presence: true, length: { maximum: 4000 }
  validates :price, presence: true, length: { in: 1..4 }
  validates :year, presence: true, length: { is: 4 }
  validates :pages, presence: true
  validates :language, presence: true


  mount_uploader :image, BookUploader

    # def self.by_category_and_author(category = nil, author = nil)
    #   return where(category: category, author: author) if category && author
    #   return where(category: category) if category
    #   return where(author: author) if author
    #   all
    # end
end


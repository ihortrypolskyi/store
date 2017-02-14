class Author < ApplicationRecord
  has_and_belongs_to_many :books

  validates :author_first_name, presence: true, length: { in: 2..50 }
  validates :author_last_name, presence: true, length: { in: 2..50 }
end

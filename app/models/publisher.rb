class Publisher < ApplicationRecord
  has_and_belongs_to_many :books

  validates :publisher_name, presence: true, length: { maximum: 200 }, uniqueness: {case_sensitive: false}
end
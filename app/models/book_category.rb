class BookCategory < ApplicationRecord
  belongs_to :book
  belongs_to :category

  # after_commit :reindex_book
  #
  # def reindex_book
  #   books.reindex # or reindex_async
  # end
end

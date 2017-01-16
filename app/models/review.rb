class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :rating, inclusion: (0..5)
  validates :comment, length: { maximum: 500 }

  def rule_20_minutes?
    (self.created_at + 80000.minutes) > Time.new
  end
  # ???
end

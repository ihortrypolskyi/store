class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :rating, inclusion: (0..5)
  validates :comment, length: { maximum: 500 }

  def rule_17_minutes?
    (self.created_at + 17.minutes) > Time.new
  end

end

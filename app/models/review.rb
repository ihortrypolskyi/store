class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :review_status
  before_create :set_review_status
  validates :rating, inclusion: (0..5)
  validates :comment, length: { maximum: 500 }

  scope :draft, -> { where review_status_id: 1}
  scope :approved, -> { where review_status_id: 2}

  def rule_17_minutes?
    (self.created_at + 17.minutes) > Time.new
  end

  private

  def set_review_status
    self.review_status_id = 1
  end

end

class User < ApplicationRecord
  validates :first_name, presence: true, length: { in: 1..30 }
  validates :last_name, presence: true, length: { in: 1..30 }
  has_secure_password
  validates :password, presence: true, length: { in: 1..30 }, allow_nil: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { in: 3..30 }, format: { with: VALID_EMAIL_REGEX }
  before_save { email.downcase! }

  has_many :reviews, dependent: :destroy

  def to_s
    '#{first_name} #{last_name}'
  end
end

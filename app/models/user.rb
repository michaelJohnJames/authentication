class User < ApplicationRecord
  has_secure_password
  validates :username, :password, presence: true
  validates :username, uniqueness: true
  validates :password, length: { in: 6..20 }
  validates :username, length: { in: 3..20 }
end

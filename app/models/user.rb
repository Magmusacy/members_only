class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { in: 3..10 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  has_many :posts
end

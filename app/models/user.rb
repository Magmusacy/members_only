class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { in: 3..10 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  before_create { generate_remember_token }

  has_many :posts

  def generate_remember_token
    # Method that generates random base64 string
    while true do
      token = SecureRandom.urlsafe_base64
      unless User.find_by remember_token: token
        self.remember_token = token
        break
      end
    end
  end
end

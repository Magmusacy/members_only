class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  validates :body, presence: true, length: { in: 1..500 }

  belongs_to :user
end

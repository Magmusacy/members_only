class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 3..10 }
  validates :body, presence: true, length: { in: 1..500 }

  belongs_to :user
end

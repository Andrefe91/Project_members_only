class Post < ApplicationRecord
  belongs_to :user

  validates :title, :body, presence: true

  validates :title, length: {in: 5..140}
  validates :body, length: {in: 100..1500}
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  validates_associated :posts

  validates :username, :email, presence: true, uniqueness: true

  validates :username, length: {in: 5..50}
  validates :email, length: {in: 8..50}
end

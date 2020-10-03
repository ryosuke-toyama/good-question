class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tasks, dependent: :destroy
  has_many :room_users
  has_many :rooms, through: :room_users

  validates :nickname, presence: true
end

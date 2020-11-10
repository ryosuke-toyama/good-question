class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users, validate: false
  has_many :problems, dependent: :destroy

  validates :room_name, presence: true, length: {in: 1..10 }
end

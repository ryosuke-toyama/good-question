class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :room_users, dependent: :destroy
  has_many :rooms, through: :room_users, dependent: :destroy
  has_many :tasks, dependent: :destroy


  validates :nickname, presence: true, length: {in: 1..12 }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数混合で入力して下さい'
end

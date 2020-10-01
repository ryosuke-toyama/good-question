class Problem < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one_attached :image

  validates :contentm presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end

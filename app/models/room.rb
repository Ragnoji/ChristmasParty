class Room < ApplicationRecord
  validates :deadline_at, presence: true
  validates :city_id, presence: true

  has_many :messages, dependent: :destroy
  has_many :room_memberships, dependent: :destroy
  has_many :users, through: :room_memberships
end

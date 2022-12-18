class Room < ApplicationRecord
  validates :deadline_at, presence: true
  validates :city_id, presence: true

  has_many :messages, dependent: :destroy
end

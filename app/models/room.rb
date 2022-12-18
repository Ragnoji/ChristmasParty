class Room < ApplicationRecord
  validates :deadline_at, presence: true
  validates :city_id, presence: true
end

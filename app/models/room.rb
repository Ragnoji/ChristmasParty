class Room < ApplicationRecord
  validates :city_id, presence: true
end

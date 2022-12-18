class Room < ApplicationRecord
  validates :deadline_at, presence: true
end

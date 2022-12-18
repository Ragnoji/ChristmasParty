class Room < ApplicationRecord
  validates :city_id, presence: true

  has_many :messages, dependent: :destroy
end

class RoomMembership < ApplicationRecord
  extend Enumerize

  ROLES = %i[owner member].freeze

  belongs_to :room
  belongs_to :user 

  enumerize :role, in: ROLES 
end

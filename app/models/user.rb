class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :date_of_birth, presence: true

  has_many :messages, dependent: :destroy
  has_many :room_memberships, dependent: :restrict_with_error
  has_many :rooms, through: :room_memberships
end

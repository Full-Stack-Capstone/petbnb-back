class User < ApplicationRecord
  has_many :pets
  has_many :pet_rooms
  has_many :reservations
  validates :name, presence: true, length: { maximum: 50 }
end

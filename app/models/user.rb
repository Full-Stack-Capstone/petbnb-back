class User < ApplicationRecord
  has_many :pets
  has_many :pet_rooms
end

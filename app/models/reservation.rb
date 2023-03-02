class Reservation < ApplicationRecord
  belongs_to :pet
  belongs_to :pet_room
  belongs_to :user
end

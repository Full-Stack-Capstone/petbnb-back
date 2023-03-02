class Reservation < ApplicationRecord
  belongs_to :pet
  belongs_to :pet_room

  validates :start_date, presence: true
  validates :end_date, presence: true
end
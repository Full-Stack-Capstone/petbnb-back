class Reservation < ApplicationRecord
  belongs_to :pet
  belongs_to :pet_room

  validates :start_date, presence: true, future_date: true
  validates :end_date, presence: true, future_date: true

  private

  def future_date
    errors.add(:start_date, "must be in the future") if start_date.present? && start_date < Date.today
    errors.add(:end_date, "must be in the future") if end_date.present? && end_date < Date.today
  end
end
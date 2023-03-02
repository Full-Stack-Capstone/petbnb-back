class Pet < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }
  validates :pet_type, presence: true
  validates :date_of_birth, presence: true
  validates :size, presence: true
  validates :allergies, presence: true

end

class PetRoom < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }
  validates :type_of_pet, presence: true, length: { maximum: 50 }
  validates :max_size_accepted, presence: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: { greater_than: 0 }
end

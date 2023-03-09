class PetRoom < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_one_attached :image
  validates :name, presence: true, length: { maximum: 50 }
  validates :type_of_pet, presence: true, length: { maximum: 50 }
  validates :max_size_accepted, presence: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: { greater_than: 0 }

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end

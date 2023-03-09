class PetRoomSerializer
  include FastJsonapi::ObjectSerializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :price, :max_size_accepted, :type_of_pet, :image, :rating, :image_url

  def image
    rails_blob_path(object.image, only_path: true) if object.image.attached?
  end
end

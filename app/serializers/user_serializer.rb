class UserSerializer
  include FastJsonapi::ObjectSerializer
  include Rails.application.routes.url_helpers
  attributes :id, :email, :image, :created_at, :updated_at

  def image_data
    rails_blob_path(object.image) if object.image.attached?
  end
end

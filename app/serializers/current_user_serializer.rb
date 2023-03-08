class CurrentUserSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :email, :image, :created_at, :updated_at
end

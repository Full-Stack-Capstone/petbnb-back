class CurrentUserController < ApplicationController
  include Rails.application.routes.url_helpers

  before_action :authenticate_user!
  def index
    render json: CurrentUserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok
  end
end

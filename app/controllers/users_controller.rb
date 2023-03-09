class UsersController < ApplicationController
  include Rails.application.routes.url_helpers
  before_action :set_user, only: %i[show update destroy]
  before_action :authenticate_user!, only: %i[show update destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    @user.image.attached? ? (image_url = rails_blob_path(@user.image, disposition: 'attachment', only_path: true)) : (image_url = nil)
    # add image url to user object to be sent to frontend
    @user = @user.attributes.merge(image_url:)
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.permit(:name, :image)
  end
end

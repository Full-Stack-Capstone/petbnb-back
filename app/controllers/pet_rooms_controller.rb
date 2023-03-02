class PetRoomsController < ApplicationController
  before_action :set_pet_room, only: %i[show update destroy]
  before_action :set_user, only: %i[index show update destroy]

  # GET /pet_rooms from user
  def index
    @pet_rooms = PetRoom.where(user: @user)

    render json: @pet_rooms
  end

  # Get all rooms, no need login, homepage
  def public
    @pet_rooms = PetRoom.all
    render json: @pet_rooms
  end

  # GET /pet_rooms/1
  def show
    render json: @pet_room
  end

  # POST /pet_rooms
  def create
    @pet_room = PetRoom.new(pet_room_params)

    if @pet_room.save
      render json: @pet_room, status: :created, location: @pet_room
    else
      render json: @pet_room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pet_rooms/1
  def update
    if @pet_room.update(pet_room_params)
      render json: @pet_room
    else
      render json: @pet_room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pet_rooms/1
  def destroy
    @pet_room.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pet_room
    @pet_room = PetRoom.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  # Only allow a list of trusted parameters through.
  def pet_room_params
    params.require(:pet_room).permit(:name, :type_of_pet, :max_size_accepted, :rating, :price)
  end
end

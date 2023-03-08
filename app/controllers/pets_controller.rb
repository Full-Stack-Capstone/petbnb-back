class PetsController < ApplicationController
  before_action :set_pet, only: %i[show update destroy]
  before_action :set_user
  before_action :authenticate_user!

  # GET /pets
  def index
    @pets = current_user.pets
    # @pets = Pet.where(user: current_user)
    render json: @pets
  end

  # GET /pets/1
  def show
    render json: @pet
  end

  # POST /pets
  def create
    @pet = current_user.pets.build(pet_params)

    if @pet.save
      render json: @pet, status: :created, location: @pet
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pets/1
  def update
    if @pet.update(pet_params)
      render json: @pet
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pets/1
  def destroy
    @pet.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pet
    @pet = Pet.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  # Only allow a list of trusted parameters through.
  def pet_params
    params.require(:pet).permit(:name, :pet_type, :date_of_birth, :size, :breed, :gender, :hair_length, :allergies, :extra_information,
                                :user_id)
  end
end

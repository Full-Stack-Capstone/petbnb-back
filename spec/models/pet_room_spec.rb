require 'rails_helper'
require 'faker'

RSpec.describe PetRoom, type: :model do
  before do
    @user = User.create(name: 'Tom')
    @user.save
    @pet = Pet.create(name: Faker::Creature::Cat.name,
      pet_type: "cat",
      date_of_birth: Faker::Date.birthday(min_age: 1, max_age: 18),
      size: "small",
      allergies: "none",
      extra_information: "none",
      breed: Faker::Creature::Cat.breed,
      gender: Faker::Creature::Dog.gender,
      hair_length: Faker::Creature::Dog.coat_length,
      user_id: @user.id) 
      @pet.save
      @pet_room = PetRoom.create(name: "My Room", 
        type_of_pet: "dog", 
        max_size_accepted: "small", 
        rating: [rand(1..5), rand(1..5), rand(1..5), rand(1..5), rand(1..5)], 
        price: 100,
        user_id: @user.id)
      
  end 

  it 'name should be present' do
    @pet_room.name = nil
    expect(@pet_room).to_not be_valid
  end

  it 'type_of_pet should be present' do
    @pet_room.type_of_pet = nil
    expect(@pet_room).to_not be_valid
  end

  it 'max_size_accepted should be present' do
    expect(@pet_room.max_size_accepted).to eq("small")
  end

  it 'price should be present' do
    expect(@pet_room.price).to eq(100)
  end
end

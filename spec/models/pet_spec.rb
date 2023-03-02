require 'rails_helper'
require 'faker'

RSpec.describe Pet, type: :model do
  before do
    @user = User.create(name: 'Tom')
    @user.save
    @pet = Pet.create(name: Faker::Creature::Cat.name,
                      pet_type: 'cat',
                      date_of_birth: Faker::Date.birthday(min_age: 1, max_age: 18),
                      size: 'small',
                      allergies: 'none',
                      extra_information: 'none',
                      breed: Faker::Creature::Cat.breed,
                      gender: Faker::Creature::Dog.gender,
                      hair_length: Faker::Creature::Dog.coat_length,
                      user_id: @user.id)
    @pet.save
  end

  it 'name should be present' do
    @pet.name = nil
    expect(@pet).to_not be_valid
  end

  it 'pet_type should be present' do
    @pet.pet_type = nil
    expect(@pet).to_not be_valid
  end

  it 'date_of_birth should be present' do
    @pet.date_of_birth = nil
    expect(@pet).to_not be_valid
  end

  it 'size should be present' do
    @pet.size = nil
    expect(@pet).to_not be_valid
  end

  it 'allergies should be present' do
    @pet.allergies = nil
    expect(@pet).to_not be_valid
  end
end

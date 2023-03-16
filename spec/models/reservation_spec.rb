require 'rails_helper'

RSpec.describe Reservation, type: :model do
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
    @pet_room = PetRoom.create(name: 'My Room',
                               type_of_pet: 'dog',
                               max_size_accepted: 'small',
                               rating: [rand(1..5), rand(1..5), rand(1..5), rand(1..5), rand(1..5)],
                               price: 100,
                               user_id: @user.id)
    @reservation = Reservation.create(start_date: '2021-01-01',
                                      end_date: Faker::Date.between(from: Date.today,
                                                                    to: 2.days.from_now),
                                      pet_id: @pet.id,
                                      pet_room_id: @pet_room.id)
  end

  it 'start_date should be present' do
    @reservation.start_date = nil
    expect(@reservation).to_not be_valid
  end

  it 'end_date should be present' do
    @reservation.end_date = nil
    expect(@reservation).to_not be_valid
  end
end

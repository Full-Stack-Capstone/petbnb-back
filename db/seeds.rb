require 'faker'

users = []
pet_rooms = []
pets = []

sizes = ["small", "medium", "large"]

5.times do
  users << User.create( name: Faker::Name.name )
end

users.each do |user|
  2.times do
    pet_rooms << user.pet_rooms.create( name: "My Room",
                                        type_of_pet: "dog",
                                        max_size_accepted: "small",
                                        rating: [rand(1..5), rand(1..5), rand(1..5), rand(1..5), rand(1..5)],
                                        price: 100,
                                        user_id: user.id
                                      )
  end
  pets << user.pets.create( name: Faker::Creature::Dog.name,
                            pet_type: "dog",
                            date_of_birth: Faker::Date.birthday(min_age: 1, max_age: 18),
                            size: sizes.sample,
                            alergies: "none",
                            extra_information: "none",
                            breed: Faker::Creature::Dog.breed,
                            gender: Faker::Creature::Dog.gender,
                            hair_length: Faker::Creature::Dog.coat_length,
                            user_id: user.id
                          )

  pets << user.pets.create( name: Faker::Creature::Cat.name,
                            pet_type: "cat",
                            date_of_birth: Faker::Date.birthday(min_age: 1, max_age: 18),
                            size: "small",
                            alergies: "none",
                            extra_information: "none",
                            breed: Faker::Creature::Cat.breed,
                            gender: Faker::Creature::Dog.gender,
                            hair_length: Faker::Creature::Dog.coat_length,
                            user_id: user.id
                          )


end

users.each do |user|
    Reservation.create( start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
                        end_date: Faker::Date.between(from: Date.today, to: 2.days.from_now),
                        pet_id: user.pets.first.id,
                        pet_room_id: pet_rooms.sample.id,
                        user_id: user.id
                      )
end


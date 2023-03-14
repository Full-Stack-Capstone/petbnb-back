require 'faker'

users = []
pet_rooms = []
dogs = []
cats = []

sizes = ["small", "medium", "large"]

user_test = User.create( name: 'Test',
  email: 'test@mail.com',
  password: 'user123',
  jti: SecureRandom.uuid )

pet_rooms << user_test.pet_rooms.create( name: "My dog room",
  type_of_pet: "dog",
  max_size_accepted: "small",
  rating: [rand(1..5), rand(1..5), rand(1..5), rand(1..5), rand(1..5)],
  price: 100,
  user_id: user_test.id
)
3.times do
  dog = user_test.pets.create( name: Faker::Creature::Dog.name,
    pet_type: "dog",
    date_of_birth: Faker::Date.birthday(min_age: 1, max_age: 18),
    size: sizes.sample,
    allergies: "none",
    extra_information: "none",
    breed: Faker::Creature::Dog.breed,
    gender: Faker::Creature::Dog.gender,
    hair_length: Faker::Creature::Dog.coat_length,
    user_id: 1
  )
  dog.image.attach(io: File.open("#{Rails.root}/app/assets/pet_images/dog#{rand(1..10)}.jpg"), filename: "dog#{rand(1..10)}.jpg")
end
2.times do
  cat = user_test.pets.create( 
    name: Faker::Creature::Cat.name,
    pet_type: "cat",
    date_of_birth: Faker::Date.birthday(min_age: 1, max_age: 18),
    size: "small",
    allergies: "none",
    extra_information: "none",
    breed: Faker::Creature::Cat.breed,
    gender: Faker::Creature::Dog.gender,
    hair_length: Faker::Creature::Dog.coat_length,
    user_id: 1
  )
  cat.image.attach(io: File.open("#{Rails.root}/app/assets/pet_images/cat#{rand(1..5)}.jpg"), filename: "cat#{rand(1..5)}.jpg")
end

5.times do
  users << User.create( name: Faker::Name.name,
                        email: Faker::Internet.email,
                        password: 'user123',
                        jti: SecureRandom.uuid )
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
  2.times do
    dogs << user.pets.create( name: Faker::Creature::Dog.name,
                              pet_type: "dog",
                              date_of_birth: Faker::Date.birthday(min_age: 1, max_age: 18),
                              size: sizes.sample,
                              allergies: "none",
                              extra_information: "none",
                              breed: Faker::Creature::Dog.breed,
                              gender: Faker::Creature::Dog.gender,
                              hair_length: Faker::Creature::Dog.coat_length,
                              user_id: user.id
                            )
  end

  cats << user.pets.create( name: Faker::Creature::Cat.name,
                            pet_type: "cat",
                            date_of_birth: Faker::Date.birthday(min_age: 1, max_age: 18),
                            size: "small",
                            allergies: "none",
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

Reservation.create( start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
                        end_date: Faker::Date.between(from: Date.today, to: 2.days.from_now),
                        pet_id: user_test.pets.first.id,
                        pet_room_id: pet_rooms.sample.id,
                        user_id: user_test.id
                      )

                      # ADD IMAGES TO PETS
# dogs

i = 0
10.times do
  the_pet = dogs[i]
  the_pet.image.attach(io: File.open("#{Rails.root}/app/assets/pet_images/dog#{i+1}.jpg"), filename: "dog#{i+1}.jpg")
  i = i + 1
end

i = 0
5.times do
  the_pet = cats[i]
  the_pet.image.attach(io: File.open("#{Rails.root}/app/assets/pet_images/cat#{i+1}.jpg"), filename: "cat#{i+1}.jpg")
  i = i + 1
end

i = 1
pet_rooms.each do |pet_room|
  pet_room.image.attach(io: File.open("#{Rails.root}/app/assets/pet_rooms/petRoom#{i}.jpg"), filename: "petRoom#{i}.jpg")
  i = i + 1
end


require 'rails_helper'

RSpec.describe '/pets', type: :request do
  before(:each) do
    @user = User.create(name: Faker::Internet.email, email: 'asd@mail.com', password: 'password')
    sign_in @user
  end

  let(:valid_attributes) do
    {
      name: 'Hulk',
      pet_type: 'dog',
      date_of_birth: Faker::Date.birthday(min_age: 1, max_age: 18),
      size: 'small',
      allergies: 'none',
      extra_information: 'none',
      breed: Faker::Creature::Dog.breed,
      gender: Faker::Creature::Dog.gender,
      hair_length: Faker::Creature::Dog.coat_length,
      user_id: @user.id
    }
  end

  let(:new_attributes) do
    {
      size: 'big'
    }
  end

  let(:invalid_attributes) do
    {
      name: 'longer than 50 jfdofhdsuihfviusdhgvuidsvhsdauvhsuvhu',
      pet_type: 'dog',
      date_of_birth: Faker::Date.birthday(min_age: 1, max_age: 18),
      size: 12_325,
      extra_information: 'none',
      breed: Faker::Creature::Dog.breed,
      gender: Faker::Creature::Dog.gender,
      hair_length: Faker::Creature::Dog.coat_length,
      user_id: @user.id
    }
  end

  let(:valid_headers) do
    { authorization: 'bearer token' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Pet.create! valid_attributes
      get pets_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      pet = Pet.create! valid_attributes
      get pet_url(pet), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Pet' do
        expect do
          post pets_url,
               params: { pet: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Pet, :count).by(1)
      end

      it 'renders a JSON response with the new pet' do
        post pets_url,
             params: { pet: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Pet' do
        expect do
          post pets_url,
               params: { pet: invalid_attributes }, as: :json
        end.to change(Pet, :count).by(0)
      end

      it 'renders a JSON response with errors for the new pet' do
        post pets_url,
             params: { pet: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      it 'updates the requested pet' do
        pet = Pet.create! valid_attributes
        patch pet_url(pet),
              params: { pet: new_attributes }, headers: valid_headers, as: :json
        pet.reload
        expect(pet.size).to eq('big')
      end

      it 'renders a JSON response with the pet' do
        pet = Pet.create! valid_attributes
        patch pet_url(pet),
              params: { pet: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the pet' do
        pet = Pet.create! valid_attributes
        patch pet_url(pet),
              params: { pet: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested pet' do
      pet = Pet.create! valid_attributes
      expect do
        delete pet_url(pet), headers: valid_headers, as: :json
      end.to change(Pet, :count).by(-1)
    end
  end
end

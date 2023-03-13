require 'rails_helper'

RSpec.describe '/pet_rooms', type: :request do
  before(:each) do
    @user = User.create(name: Faker::Internet.email, email: 'asd@mail.com', password: 'password')
    sign_in @user
  end

  let(:valid_attributes) do
    {
      name: 'My dog room',
      type_of_pet: 'dog',
      max_size_accepted: 'small',
      rating: [rand(1..5), rand(1..5), rand(1..5), rand(1..5), rand(1..5)],
      price: 100,
      user_id: @user.id
    }
  end

  let(:new_attributes) do
    {
      name: 'Room name changed'
    }
  end

  let(:invalid_attributes) do
    {
      name: 'longer than 50 jfdofhdsuihfviusdhgvuidsvhsdauvhsuvhu',
      type_of_pet: 'dog',
      max_size_accepted: 'small',
      rating: [rand(1..5), rand(1..5), rand(1..5), rand(1..5), rand(1..5)],
      price: 100,
      user_id: @user.id
    }
  end

  let(:valid_headers) do
    { authorization: 'bearer token' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      PetRoom.create! valid_attributes
      get pet_rooms_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      pet_room = PetRoom.create! valid_attributes
      get pet_room_url(pet_room), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new PetRoom' do
        expect do
          post pet_rooms_url,
               params: { pet_room: valid_attributes }, headers: valid_headers, as: :json
        end.to change(PetRoom, :count).by(1)
      end

      it 'renders a JSON response with the new pet_room' do
        post pet_rooms_url,
             params: { pet_room: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new PetRoom' do
        expect do
          post pet_rooms_url,
               params: { pet_room: invalid_attributes }, as: :json
        end.to change(PetRoom, :count).by(0)
      end

      it 'renders a JSON response with errors for the new pet_room' do
        post pet_rooms_url,
             params: { pet_room: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      it 'updates the requested pet_room' do
        pet_room = PetRoom.create! valid_attributes
        patch pet_room_url(pet_room),
              params: { pet_room: new_attributes }, headers: valid_headers, as: :json
        pet_room.reload
        expect(pet_room.name).to eq(new_attributes[:name])
      end

      it 'renders a JSON response with the pet_room' do
        pet_room = PetRoom.create! valid_attributes
        patch pet_room_url(pet_room),
              params: { pet_room: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the pet_room' do
        pet_room = PetRoom.create! valid_attributes
        patch pet_room_url(pet_room),
              params: { pet_room: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested pet_room' do
      pet_room = PetRoom.create! valid_attributes
      expect do
        delete pet_room_url(pet_room), headers: valid_headers, as: :json
      end.to change(PetRoom, :count).by(-1)
    end
  end
end

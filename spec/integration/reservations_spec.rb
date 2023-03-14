require 'rails_helper'

RSpec.describe '/reservations', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Reservation. As you add validations to Reservation, be sure to
  # adjust the attributes here as well.
  before(:each) do
    @user = User.create(name: 'Test', email: '1@mail.com', password: '123123', jti: SecureRandom.uuid)
    @pet = Pet.create(name: 'Pet 1', pet_type: 'Dog', date_of_birth: '11-11-2011', size: 'small', breed: 'dog', gender: '2022',
                      hair_length: 'short', allergies: 'none', extra_information: 'none', user_id: @user.id)
    @pet.save
    @pet_room = PetRoom.create(name: 'PetRoom 1', type_of_pet: 'Dog', max_size_accepted: 'Big', rating: [1, 2, 3], price: 12,
                               user_id: @user.id)
    @pet_room.save
    sign_in @user
  end
  let(:valid_attributes) do
    { pet_id: @pet.id, pet_room_id: @pet_room.id, user_id: @user.id, start_date: '11-11-2011', end_date: '12-11-2012' }
  end

  let(:invalid_attributes) do
    { pet_id: @pet.id, pet_room_id: 'asd', user_id: @user.id, start_date: '11-11-2011', end_date: '12-11-2012' }
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Reservation.create! valid_attributes
      get reservations_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      reservation = Reservation.create! valid_attributes
      get reservation_url(reservation), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Reservation' do
        expect do
          post reservations_url,
               params: { reservation: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Reservation, :count).by(1)
      end

      it 'renders a JSON response with the new reservation' do
        post reservations_url,
             params: { reservation: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Reservation' do
        expect do
          post reservations_url,
               params: { reservation: invalid_attributes }, as: :json
        end.to change(Reservation, :count).by(0)
      end

      it 'renders a JSON response with errors for the new reservation' do
        post reservations_url,
             params: { reservation: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { pet_id: @pet.id, pet_room_id: @pet_room.id, user_id: @user.id, start_date: '11-11-2022', end_date: '12-11-2034' }
      end

      it 'updates the requested reservation' do
        reservation = Reservation.create! valid_attributes
        patch reservation_url(reservation),
              params: { reservation: new_attributes }, headers: valid_headers, as: :json
        reservation.reload
      end

      it 'renders a JSON response with the reservation' do
        reservation = Reservation.create! valid_attributes
        patch reservation_url(reservation),
              params: { reservation: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the reservation' do
        reservation = Reservation.create! valid_attributes
        patch reservation_url(reservation),
              params: { reservation: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested reservation' do
      reservation = Reservation.create! valid_attributes
      expect do
        delete reservation_url(reservation), headers: valid_headers, as: :json
      end.to change(Reservation, :count).by(-1)
    end
  end
end

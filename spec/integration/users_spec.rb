require 'rails_helper'

RSpec.describe '/users', type: :request do
  before(:each) do
    @user = User.create(name: 'Test', email: '1@mail.com', password: '123123', jti: SecureRandom.uuid)
    sign_in @user
  end
  let(:valid_attributes) do
    { name: 'Test', email: 'tesaaasdsdt@mail.com', password: '123123', jti: SecureRandom.uuid }
  end

  let(:invalid_attributes) do
    { name: '', email: '', password: '123123', jti: SecureRandom.uuid }
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get users_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get user_url(@user.id), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect do
          post users_url, params: { user: valid_attributes }, as: :json
        end.to change(User, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new User' do
        expect do
          post users_url,
               params: { user: invalid_attributes }, as: :json
        end.to change(User, :count).by(0)
      end

      it 'renders a JSON response with errors for the new user' do
        post users_url,
             params: { user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { name: 'Test2', email: 'test2@mail.com', password: '1231232', jti: SecureRandom.uuid }
      end

      it 'updates the requested user' do
        patch user_url(@user.id),
              params: { user: new_attributes }, as: :json
        @user.reload
        expect(response).to have_http_status(:ok)
      end

      it 'renders a JSON response with the user' do
        user = User.create! valid_attributes
        patch user_url(user),
              params: { user: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the user' do
        user = User.create! valid_attributes
        patch user_url(user),
              params: { user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested user' do
      user = User.create! valid_attributes
      expect do
        delete user_url(user), headers: valid_headers, as: :json
      end.to change(User, :count).by(-1)
    end
  end
end

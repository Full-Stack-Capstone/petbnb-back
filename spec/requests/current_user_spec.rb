require 'rails_helper'

RSpec.describe 'CurrentUsers', type: :request do
  describe 'GET /index' do
    let(:user) { User.create(name: Faker::Internet.email, email: 'asd@mail.com', password: 'password') }
    before { sign_in user }

    it 'returns http success' do
      get '/current_user'
      expect(response).to be_successful
    end
  end
end

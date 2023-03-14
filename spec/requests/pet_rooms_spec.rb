require 'swagger_helper'

RSpec.describe 'pet_rooms', type: :request do
  path '/' do
    get('list pet rooms') do
      produces 'application/json'
      let!(:pet_room) { create(:pet_room) }

      response(200, 'successful') do
        run_test! do |response|
          response = JSON.parse(response.body)
          expect(response.first['id']).to eq(pet_room.id)
          expect(response.first['name']).to eq(pet_room.name)
        end
      end
    end
  end

  # path '/pet_rooms/{id}' do
  #   # You'll want to customize the parameter types...
  #   parameter name: 'id', in: :path, type: :string, description: 'id'

  #   get('show pet_room') do
  #     response(200, 'successful') do
  #       let(:id) { '123' }

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end

  #   patch('update pet_room') do
  #     response(200, 'successful') do
  #       let(:id) { '123' }

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end

  #   put('update pet_room') do
  #     response(200, 'successful') do
  #       let(:id) { '123' }

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end

  #   delete('delete pet_room') do
  #     response(200, 'successful') do
  #       let(:id) { '123' }

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end
  # end

  # path '/' do
  #   get('public pet_room') do
  #     response(200, 'successful') do
  #       run_test!
  #     end
  #   end
  # end
end

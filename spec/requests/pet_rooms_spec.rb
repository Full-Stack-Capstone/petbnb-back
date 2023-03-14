require 'swagger_helper'

RSpec.describe 'pet_rooms', type: :request do
  path '/' do
    get('list pet_rooms') do
      tags 'Pet rooms'
      produces 'applicaton/json'
      response(200, 'successful') do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 type_of_pet: { type: :string },
                 max_size_accepted: { type: :string },
                 rating: { type: :integer },
                 price: { type: :number }
               }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/pet_rooms' do
    post('create a pet_room') do
      tags 'Create a pet room'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          pet_room: {
            type: :object,
            properties: {
              name: { type: :string },
              type_of_pet: { type: :string },
              max_size_accepted: { type: :string },
              price: { type: :number }
            }
          }
        }
      }

      response(201, 'successful') do
        let(:params) do
          {
            pet_room: {
              name: 'Test Room',
              type_of_pet: 'cat',
              max_size_accepted: 'medium',
              price: 50
            }
          }
        end
        run_test!
      end
    end
  end

  path '/pet_rooms/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show pet_room') do
      tags 'Show single pet room'
      produces 'application/json'
      response(200, 'successful') do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 type_of_pet: { type: :string },
                 max_size_accepted: { type: :string },
                 rating: { type: :integer },
                 price: { type: :number }
               }
        let(:id) { '1' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end

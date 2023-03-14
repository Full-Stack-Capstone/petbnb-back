require 'swagger_helper'

describe 'Login' do
  path '/login' do
    post 'Logs in a user' do
      tags 'Authentication'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :credentials, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string }
            },
            required: %w[email password]
          }
        }
      }
      response '200', 'logged in succesfully' do
        schema type: :object,
               properties: {
                 id: { type: :string },
                 email: { type: :string },
                 created_at: { type: :string, format: :datetime }
               },
               required: ['token']
        let(:credential) do
          { user: {
            email: 'test@mail.com',
            password: 'user123'
          } }
        end
        run_test!
      end
      response '401', 'unauthorized' do
        let(:credentials) { { email: 'test@mail.com', password: 'wrong_password' } }
        run_test!
      end
    end
  end
end

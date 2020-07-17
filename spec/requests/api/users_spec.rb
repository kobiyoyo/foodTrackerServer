require 'swagger_helper'

RSpec.describe '/api/v1/users_controller', type: :request do
  path '/api/v1/users' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          password: { type: :string },
          email: { type: :string },
          role: { type: :integer }

        },
        required: %w[email password username role]
      }

      response '201', 'user created' do
        let(:user){  User.create(username: 'chubi adama', email: 'dani@gmail.com', password_digest: 'chubiadama', role: 'client')}
            run_test!
      end

      response '422', 'invalid request' do
        let(:user){ FactoryBot.create(:user) }
            run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    get 'Retrieves a user' do
      tags 'Users'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'user found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 username: { type: :string },
                 password: { type: :string },
                 email: { type: :string },
                 role: { type: :integer }
               },
               required: %w[id username role email]

        let(:id){ FactoryBot.create(:user).id }
          run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
        run_test!
      end
    end
 
  end
end

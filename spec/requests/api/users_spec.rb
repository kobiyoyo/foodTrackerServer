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
        required: %w[email password username]
      }

      response '201', 'user created' do
        let(:user) do
          { username: 'chubi adama',
            email: 'adamachubi@gmail.com',
            password_digest: 'chubi', role: 'client' }
        end
      end

      response '422', 'invalid request' do
        let(:user) do
          { username: 'chubi adama',
            email: '',
            password_digest: '', role: 'client' }
        end
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
               required: %w[id username]

        let(:id) do
          User.create(username: 'chubi adama',
                      email: 'adamachubi@gmail.com',
                      password_digest: 'chubi', role: 'client').id
        end
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
      end
    end
    delete 'Deletes a user' do
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
               required: %w[id username]

        let(:id) do
          User.create(username: 'chubi adama',
                      email: 'adamachubi@gmail.com',
                      password_digest: 'chubi', role: 'client').id
        end
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
      end
    end

    patch 'Edit a user parameter' do
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
               required: %w[id username]

        let(:id) do
          User.create(username: 'chubi adama',
                      email: 'adamachubi@gmail.com',
                      password_digest: 'chubi', role: 'client').id
        end
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
      end
    end
  end
end

require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do
path '/users' do

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
        required: [ 'title']
      }

      response '201', 'user created' do
        let(:user) { { username: 'chubi adama', email: 'adamachubi@gmail.com', password_digest:'chubi', role: "client" } }
        run_test!
      end

      response '422', 'invalid request' do
              let(:user) { { username: 'chubi adama', email: 'adamachubi@gmail.com', password_digest:'chubi', role: "client" } }
        run_test!
      end
    end
  end

  path '/users/{id}' do
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
          required: [ 'id', 'title']

        let(:id) { User.create(username: 'chubi adama', email: 'adamachubi@gmail.com', password_digest:'chubi', role: "client" ).id }
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
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
          required: [ 'id', 'title']

        let(:id) { User.create(username: 'chubi adama', email: 'adamachubi@gmail.com', password_digest:'chubi', role: "client" ).id }
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
    put 'Edits all user parameters' do
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
          required: [ 'id', 'title']

        let(:id) { User.create(username: 'chubi adama', email: 'adamachubi@gmail.com', password_digest:'chubi', role: "client" ).id }
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
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
          required: [ 'id', 'title']

        let(:id) { User.create(username: 'chubi adama', email: 'adamachubi@gmail.com', password_digest:'chubi', role: "client" ).id }
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end
end

require 'acceptance_helper'
require_relative '../support/authentication'

resource 'Users' do
  let!(:users) { FactoryBot.create(:user, role: 'admin', password: '123234566', password_confirmation: '123234566') }
  auth = Auth.new
  let!(:faith) { User.create(username: 'fina', email: 'fina@gmail.com', password: '123234566', password_confirmation: '123234566', role: 'admin') }
  let!(:fina) { User.create(username: 'faith', email: 'faith@gmail.com', password: '123234566', password_confirmation: '123234566', role: 'client') }
  let(:valid_headers) { auth.token(users) }
  let(:user_id) { users.id }
  before do
    header 'Authorization', valid_headers
    header 'Content-Type', 'application/json'
  end

  get 'api/v1/users' do
    example_request 'Get all users' do
      expect(status).to eq 200
    end
  end
  get 'api/v1/users/:user_id' do
    example_request 'Get a user' do
      expect(status).to eq 200
    end
  end
  post 'api/v1/users' do
    route_summary 'This is used to create a user'
    parameter :username, 'User username'
    parameter :email, 'User email'
    parameter :role, 'User role'
    parameter :password, 'User password'
    parameter :password_confirmation, 'User password confirmation'
    example_request 'Create a user' do
      do_request(username: 'simon', email: 'simon@gmail.com', password: '123234566', password_confirmation: '123234566', role: 'client')
      expect(status).to eq 201
    end
  end
  patch 'api/v1/users/:user_id' do
    route_summary 'This is used to edit a user'
    parameter :username, 'User username'
    parameter :email, 'User email'
    parameter :role, 'User role'
    parameter :password, 'User password'
    parameter :password_confirmation, 'User password confirmation'
    example_request 'Edit a user' do
      do_request(username: 'eleojo', email: 'simon@gmail.com', password: '123234566', role: 'client')
      expect(status).to eq 200
    end
  end
  delete 'api/v1/users/:user_id' do
    example_request 'Delete a user' do
      expect(status).to eq 200
    end
  end
end

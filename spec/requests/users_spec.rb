require 'rails_helper'
require_relative '../support/authentication'

RSpec.describe '/users', type: :request do
  auth = Auth.new
  let(:users) do
    FactoryBot.create(:user, username: 'heavy', email: 'adfadgd@gmail.com', role: 'admin',
                             password: '123234566', password_confirmation: '123234566')
  end
  let(:valid_headers) do
    auth.authenticated_header(users)
  end
  let(:valid_attributes) { {  username: 'heavy', email: 'adfadgd@gmail.com', role: 'admin',
                             password: '123234566', password_confirmation: '123234566' } }
  let(:invalid_attributes) { { username: '', email: '', role: 'admin',password: '123234566',
                             password_confirmation: '123234566' } }


  describe 'GET /index' do
    it 'renders a successful response' do
      get '/api/v1/users', headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get "/api/v1/users/#{users.id}", headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect do
          post '/api/v1/users/',
               params:  valid_attributes , as: :json
        end.to change(User, :count).by(1)
      end

      it 'renders a JSON response with the new user' do
        post '/api/v1/users/',
             params:  valid_attributes , as: :json

        expect(response.status).to eq(201)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new User' do
        expect do
          post '/api/v1/users/',
               params:  invalid_attributes , as: :json
        end.to change(User, :count).by(0)
        expect(response).to have_http_status(:unprocessable_entity) 
      end

      it 'renders a JSON response with errors for the new user' do
        post '/api/v1/users/',
             params:  invalid_attributes , headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      it 'updates user data' do
        patch "/api/v1/users/#{users.id}",
              params: { username: 'daniel', email: 'danenemona@gmail.com', role: 'admin',
                        password: '123234566', password_confirmation: '123234566' }, headers: valid_headers, as: :json
        expect(response).to be_successful
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the user' do
        patch "/api/v1/users/#{users.id}",
              params:  invalid_attributes ,headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity) 
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested user' do
     delete "/api/v1/users/#{users.id}", headers: valid_headers, as: :json
      expect(response.status).to eq(200)
      expect(response.body).to include 'User  deleted successfully'
    end
  end
end

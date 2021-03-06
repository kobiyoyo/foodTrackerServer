require 'rails_helper'
require_relative '../support/authentication'

RSpec.describe '/intakes', type: :request do
  auth = Auth.new
  let(:users) { FactoryBot.create(:user, role: 'admin', password: '123234566', password_confirmation: '123234566') }
  let(:valid_headers) do
    auth.authenticated_header(users)
  end
  let(:intake) { FactoryBot.create(:intake) }
  let(:valid_attributes) { { title: 'hello' } }
  let(:invalid_attributes) { { title: '' } }

  describe 'GET /index' do
    it 'renders a successful response' do
      get '/api/v1/intakes', headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get '/api/v1/intakes', as: :json, headers: valid_headers
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Intake' do
        expect do
          post '/api/v1/intakes',
               params: valid_attributes, headers: valid_headers, as: :json
        end.to change(Intake, :count).by(1)
      end

      it 'renders a JSON response with the new intake' do
        post '/api/v1/intakes',
             params: valid_attributes, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Intake' do
        expect do
          post '/api/v1/intakes',
               params: invalid_attributes, headers: valid_headers, as: :json
        end.to change(Intake, :count).by(0)
      end

      it 'renders a JSON response with errors for the new intake' do
        post '/api/v1/intakes',
             params: invalid_attributes, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      it 'updates the requested intake' do
        patch "/api/v1/intakes/#{intake.id}",
              params: valid_attributes, headers: valid_headers, as: :json
        expect(response.status).to eq(200)
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the intake' do
        patch "/api/v1/intakes/#{intake.id}",
              params: invalid_attributes, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    before do
      delete "/api/v1/intakes/#{intake.id}", headers: valid_headers, as: :json
    end

    it 'destroys the requested user' do
      expect(response.status).to eq(200)
    end

    it 'render delete message' do
      expect(response.body).to include 'Intake category deleted successfully'
    end
  end
end

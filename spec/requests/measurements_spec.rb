require 'rails_helper'
require_relative '../support/authentication'

RSpec.describe '/measurements', type: :request do
  auth = Auth.new
  let(:users) { FactoryBot.create(:user, password: '123234566', password_confirmation: '123234566') }
  let(:valid_headers) do
    auth.authenticated_header(users)
  end
  let(:intake) { FactoryBot.create(:intake) }
  let(:measurement) { FactoryBot.create(:measurement, user: users, intake: intake, units: 56) }


  describe 'GET /index' do
    it 'renders a successful response' do
      get "/api/v1/intakes/#{intake.id}/measurements", headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get "/api/v1/intakes/#{intake.id}/measurements/#{measurement.id}", as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Measurement' do
        expect do
          post "/api/v1/intakes/#{intake.id}/measurements",
               params: { measurement: measurement }, headers: valid_headers, as: :json
        end.to change(Measurement, :count).by(1)
      end

      it 'renders a JSON response with the new measurement' do
        post "/api/v1/intakes/#{intake.id}/measurements",
             params: measurement, headers: valid_headers, as: :json
        expect(response.content_type).to match(a_string_including('application/json'))
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Measurement' do
        expect do
          post "/api/v1/intakes/#{intake.id}/measurements",
               params: { measurement: '' }, headers: valid_headers, as: :json
        end.to change(Measurement, :count).by(0)
      end

      it 'renders a JSON response with errors for the new measurement' do
        post "/api/v1/intakes/#{intake.id}/measurements",
             params: { measurement: ' ' }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      it 'updates the requested measurement' do
        patch "/api/v1/intakes/#{intake.id}/measurements/#{measurement.id}",
              params: { measurement: measurement }, headers: valid_headers, as: :json
        expect(response.status).to eq(200)
      end

      it 'renders a JSON response with the measurement' do
        patch "/api/v1/intakes/#{intake.id}/measurements/#{measurement.id}",
              params: { measurement: measurement }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the measurement' do
        patch "/api/v1/intakes/#{intake.id}/measurements/#{measurement.id}",
              params: { measurement: '' }, headers: valid_headers, as: :json

        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested user' do
      delete "/api/v1/intakes/#{intake.id}/measurements/#{measurement.id}", headers: valid_headers, as: :json
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.body).to include 'Measurement deleted successfully'
    end
  end
end

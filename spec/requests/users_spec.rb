require 'rails_helper'
require_relative '../support/authentication'

RSpec.describe "/users", type: :request do

    let(:users){ FactoryBot.create(:user)} 
    auth = Auth.new

  let(:valid_headers) {
      auth.authenticated_header(users)
  }

  describe "GET /index" do
    it "renders a successful response" do
      get '/api/v1/users', headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get "/api/v1/users/#{users.id}", headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new User" do
        expect {
          post "/api/v1/users/",
               params: { user: users }, as: :json
        }.to change(User, :count).by(1)
      end

      it "renders a JSON response with the new user" do
        post "/api/v1/users/",
             params: { user: users },as: :json
        
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new User" do
        expect {
          post "/api/v1/users/",
               params: { user: '' }, as: :json
        }.to change(User, :count).by(0)
      end

      it "renders a JSON response with errors for the new user" do
        post "/api/v1/users/",
             params: { user: '' }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested user" do
        patch "/api/v1/users/#{users.id}",
              params: { user: users }, headers: valid_headers, as: :json
   
             expect(response.status).to eq(200)
      end

      it "renders a JSON response with the user" do
        patch "/api/v1/users/#{users.id}",
              params: { user: users }, headers: valid_headers, as: :json
        expect(response.status).to eq(200)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the user" do
        patch "/api/v1/users/#{users.id}",
              params: { user: ''}, headers: valid_headers, as: :json
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end

      it "renders a JSON response with errors for the user" do
        patch "/api/v1/users/#{users.id}",
              params: { user: ''},  as: :json
        expect(response.status).to eq(401)
        expect(response.content_type).to eq("text/html")
      end
  
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user" do
      delete "/api/v1/users/#{users.id}", headers: valid_headers, as: :json
      expect(response).to be_successful
      expect(response.status).to eq(200)
    end
  end
end

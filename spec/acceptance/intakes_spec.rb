require 'acceptance_helper'
require_relative '../support/authentication'

resource "Intakes" do
  let!(:intakes) { FactoryBot.create(:intake)  }
  let!(:users) { FactoryBot.create(:user, role: 'admin')  }
  auth = Auth.new
  let!(:oil) {FactoryBot.create(:intake,title:'Oil and fatty acid') }
  let!(:yam) { FactoryBot.create(:intake,title:'sea foods') }
  let(:valid_headers) do
    auth.token(users)
  end
  before do
    header 'Authorization', valid_headers
    header 'Content-Type', 'application/json'
  end
  get "api/v1/intakes" do
    example_request "Get all intakes" do
    explanation 'List all the intakes'
      expect(status).to eq 200
    
    end
  end
  get "api/v1/intakes/:intake_id" do
  	let(:intake_id){intakes.id}
    example_request "Get a intake" do
    explanation 'Show a intake'
      expect(status).to eq 200
    
    end
  end
  post "api/v1/intakes" do
  	route_summary 'This is used to create a intake'
  	parameter :title, 'User title'
    example_request "Create a intake" do
    explanation 'Create a intake'
    do_request(title:'Protein')
      expect(status).to eq 201
    
    end
  end
  patch "api/v1/intakes/:intake_id" do
  	let(:intake_id){intakes.id}
  	route_summary 'This is used to edit a intake'
    parameter :title, 'User title'
    example_request "Edit a intake" do
    explanation 'Edit a intake'
    do_request(title:'Vitamins')
      expect(status).to eq 200
    
    end
  end
  delete "api/v1/intakes/:intake_id" do
  	let(:intake_id){intakes.id}
    example_request "Delete a intake" do
    explanation 'Delete a intake'
      expect(status).to eq 200
    
    end
  end
end
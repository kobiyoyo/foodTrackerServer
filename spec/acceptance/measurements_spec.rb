require 'acceptance_helper'
require_relative '../support/authentication'

resource 'Measurements' do
  let!(:intakes) { FactoryBot.create(:intake) }
  let!(:users) { FactoryBot.create(:user, role: 'admin', password: '123234566', password_confirmation: '123234566') }
  auth = Auth.new
  let!(:measurement) { FactoryBot.create(:measurement, user: users, intake: intakes, units: 56) }
  let!(:measurementone) { FactoryBot.create(:measurement, user: users, intake: intakes, units: 63) }
  let!(:measurementtwo) { FactoryBot.create(:measurement, user: users, intake: intakes, units: 98) }
  let(:valid_headers) { auth.token(users) }
  let(:intake_id) { intakes.id }
  let(:measurement_id) { measurement.id }
  before do
    header 'Authorization', valid_headers
    header 'Content-Type', 'application/json'
  end

  get 'api/v1/intakes/:intake_id/measurements' do
    example_request 'Get all measurements' do
      explanation 'List all the measurements'
      expect(status).to eq 200
    end
  end
  get 'api/v1/intakes/:intake_id/measurements/:measurement_id' do
    example_request 'Get a measurement' do
      explanation 'Show a measurement'
      expect(status).to eq 200
    end
  end
  post 'api/v1/intakes/:intake_id/measurements' do
    route_summary 'This is used to create a intake'
    parameter :units, 'User units'
    example_request 'Create a measurement' do
      explanation 'Create a measurement'
      do_request(units: 34)
      expect(status).to eq 201
    end
  end
  patch 'api/v1/intakes/:intake_id/measurements/:measurement_id' do
    route_summary 'This is used to edit a measurement'
    parameter :units, 'User units'
    example_request 'Edit a measurement' do
      explanation 'Edit a measurement'
      do_request(units: 23)
      expect(status).to eq 200
    end
  end
  delete 'api/v1/intakes/:intake_id/measurements/:measurement_id' do
    example_request 'Delete a measurement' do
      explanation 'Delete a measurement'
      expect(status).to eq 200
    end
  end
end

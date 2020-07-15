# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe '/api/v1/measurements_controller', type: :request do
  path '/api/v1/intakes/measurements' do
    post 'Creates a measurements' do
      tags 'Measurements'
      consumes 'application/json'
      parameter name: :measurement, in: :body, schema: {
        type: :object,
        properties: {
          units: { type: :integer }

        },
        required: ['units']
      }

      response '201', 'measurement created' do
        let(:measurement) { { units: 1234 } }
      end

      response '422', 'measurement request' do
        let(:measurement) { { units: '' } }
      end
    end
  end

  path '/api/v1/intakes/{id}/measurements/{id}' do
    get 'Retrieves a measurement' do
      tags 'Measurements'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :integer

      response '200', 'measurement found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 units: { type: :integer }
               },
               required: %w[id units]

        let(:id) { Measurement.create(units: 23).id }
      end

      response '404', 'measurement not found' do
        let(:id) { 'invalid' }
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
      end
    end
    delete 'Deletes a measurement' do
      tags 'Measurements'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :integer

      response '200', 'measurement found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 units: { type: :integer }
               },
               required: %w[id units]

        let(:id) { Measurement.create(units: 23).id }
      end

      response '404', 'measurement not found' do
        let(:id) { 'invalid' }
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
      end
    end
    patch 'Edits a measurement parameter' do
      tags 'Measurements'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :integer

      response '200', 'measurement found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 units: { type: :integer }
               },
               required: %w[id units]

        let(:id) { Measurement.create(units: 23).id }
      end

      response '404', 'measurement not found' do
        let(:id) { 'invalid' }
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
      end
    end
  end
end

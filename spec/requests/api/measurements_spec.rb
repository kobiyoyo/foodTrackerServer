require 'swagger_helper'

RSpec.describe 'api/v1/measurements', type: :request do
path '/intakes/measurements' do

    post 'Creates a measurements' do
      tags 'Measurements'
      consumes 'application/json'
      parameter name: :measurement, in: :body, schema: {
        type: :object,
        properties: {
          units: { type: :integer },
         
        },
        required: [ 'units']
      }

      response '201', 'measurement created' do
        let(:measurement) { { units: 1234 } }
        run_test!
      end

      response '422', 'measurement request' do
        let(:measurement) { { units: 1234 } }
        run_test!
      end
    end
  end

  path '/intakes/{id}/measurement/{id}' do

    get 'Retrieves a measurement' do
      tags 'Measurements'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :integer

      response '200', 'measurement found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            units: { type: :integer },
          },
          required: [ 'id', 'units']

        let(:id) { Measurement.create(units: 23).id }
        run_test!
      end

      response '404', 'measurement not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
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
            units: { type: :integer },
          },
          required: [ 'id', 'units']

        let(:id) { Measurement.create(units: 23).id }
        run_test!
      end

      response '404', 'measurement not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
    put 'Edits all measurement parameters' do
      tags 'Measurements'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :integer

      response '200', 'measurement found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            units: { type: :integer },
          },
          required: [ 'id', 'units']

        let(:id) { Measurement.create(units: 23).id }
        run_test!
      end

      response '404', 'measurement not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
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
            units: { type: :integer },
          },
          required: [ 'id', 'units']

        let(:id) { Measurement.create(units: 23).id }
        run_test!
      end

      response '404', 'measurement not found' do
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

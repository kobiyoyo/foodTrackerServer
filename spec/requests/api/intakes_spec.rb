require 'swagger_helper'

RSpec.describe 'api/v1/intakes', type: :request do
 path '/intakes' do

    post 'Creates a intake' do
      tags 'Intakes'
      consumes 'application/json'
      parameter name: :intake, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
         
        },
        required: [ 'title']
      }

      response '201', 'intake created' do
        let(:intake) { { title: 'foo' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:intake) { { title: 'foo' } }
        run_test!
      end
    end
  end

  path '/intakes/{id}' do
    get 'Retrieves a intake' do
      tags 'Intakes'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'intake found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            title: { type: :string },
          },
          required: [ 'id', 'title']

        let(:id) { Intake.create(title: 'foo').id }
        run_test!
      end

      response '404', 'intake not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
    delete 'Deletes a intake' do
      tags 'Intakes'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'intake found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            title: { type: :string },
          },
          required: [ 'id', 'title']

        let(:id) { Intake.create(title: 'foo').id }
        run_test!
      end

      response '404', 'intake not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
    put 'Edits all intake parameters' do
      tags 'Intakes'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'intake found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            title: { type: :string },
          },
          required: [ 'id', 'title']

        let(:id) { Intake.create(title: 'foo').id }
        run_test!
      end

      response '404', 'intake not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
    patch 'Edits an intake parameter' do
      tags 'Intakes'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'intake found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            title: { type: :string },
          },
          required: [ 'id', 'title']

        let(:id) { Intake.create(title: 'foo').id }
        run_test!
      end

      response '404', 'intake not found' do
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

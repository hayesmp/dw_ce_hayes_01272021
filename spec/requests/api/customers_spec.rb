require 'swagger_helper'

RSpec.describe 'api/customers', type: :request do
  path '/customers' do
    post 'Create a customer' do
      tags 'Customers'
      consumes 'application/json'
      parameter name: :customer, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          name: { type: :string }
        },
        required: [ 'email', 'name' ]
      }

      response '201', 'customer created' do
        let(:customer) { { email: 'steve.smith@example.org', name: 'Steve Smith' } }
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['id'] != nil)
          expect(data['name'] == 'Steve Smith')
          expect(data['email'] == 'steve.smith@example.org')
        end
      end
    end

  end

  path '/customers/{id}' do
    get 'get a Customer' do
      tags 'Customers'
      consumes 'application/json'
      parameter name: :id, in: :path, required: true

      response '200', 'customer found' do
        let(:id) { Customer.create(email: 'steve.smith@example.org', name: 'Steve Smith').id }
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['id'] != nil)
          expect(data['name'] == 'Steve Smith')
          expect(data['email'] == 'steve.smith@example.org')
        end
      end
    end
  end
end

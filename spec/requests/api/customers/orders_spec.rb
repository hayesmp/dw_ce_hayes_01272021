require 'swagger_helper'

RSpec.describe 'api/customers/orders', type: :request do
  path '/customers/{customer_id}/orders' do
    before do
      @customer = Customer.create_with(email: 'steve.smith@example.org').find_or_create_by(name: 'Steve Smith')
      @customer.orders.find_or_create_by(sku:'ABC123')
    end

    get 'Retrieve a customers orders' do
      tags 'Orders'
      consumes 'application/json'
      parameter name: :customer_id, in: :path, type: :integer

      response '200', 'customers orders found' do
        let(:customer_id) { @customer.id }
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data.size > 0)
          expect(data[0]['id'] != nil)
          expect(data[0]['sku'] == 'ABC123')
          #expect(data[0]['total'] == 0)
          expect(data[0]['created_at'] != nil)
        end
      end
    end

    post 'Create a customer order' do
      tags 'Orders'
      consumes 'application/json'
      parameter name: :customer_id, in: :path, type: :integer
      parameter name: :order, in: :body, type: :object,
      properties: { sku: { type: :string } }

      response '201', 'Customer order created' do
        let(:customer_id) { @customer.id }
        let(:order) { { sku: 'BCD456' } }

        run_test! do
          data = JSON.parse(response.body)
          expect(data['id'] != nil)
          expect(data['sku'] == 'ABC123')
          #expect(data['total'] == 0)
          expect(data['created_at'] != nil)
        end
      end
    end
  end
end

require 'swagger_helper'


RSpec.describe 'api/products', type: :request do
  before do
    Rails.application.load_seed # loading seeds
  end

  path '/products' do
    get 'Retrieve all products' do
      tags 'Products'
      consumes 'application/json'

      response '200', 'Products listed' do
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data.size > 0)
          expect(data[0]['name'] != nil)
          expect(data[0]['description'] != nil)
          expect(data[0]['sku'] != nil)
        end
      end
    end
  end
end

require 'rails_helper'

describe CreateOrder do
  before do
    @customer = Customer.create_with(email: 'steve.smith@example.org').find_or_create_by(name: 'Steve Smith')
    @product1 = Product.create_with(name: 'Unicorn').find_or_create_by(sku: 'ABC123')
    @product1.update(quantity: 10)
    @product2 = Product.create_with(name: 'Rainbow').find_or_create_by(sku: 'DEF456')
    @product2.update(quantity: 0)
  end

  context 'Happy path' do
    it 'should create an order and change product inventory' do
      expect(@product1.quantity).to eq(10)
      order_params = { sku: @product1.sku }
      order = CreateOrder.new(customer: @customer, order_params: order_params).call!
      expect(order).not_to eq(nil)
      expect(@product1.reload.quantity).to eq(9)
    end
  end

  context 'Missing parameter' do
    it 'should throw a MissingParameter exception' do
      order_params = { sku: nil }
      expect { CreateOrder.new(customer: @customer, order_params: order_params).call! }.to raise_error(CreateOrder::MissingParameterError)
    end
  end

  context 'Insufficient inventory' do
  it 'should throw a InsufficientInventoryE exception' do
    order_params = { sku: @product2.sku }
    expect { CreateOrder.new(customer: @customer, order_params: order_params).call! }.to raise_error(CreateOrder::InsufficientInventoryError)
  end
end

end

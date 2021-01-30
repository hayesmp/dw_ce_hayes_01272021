class Customers::OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :get_customer

  def index
    orders = @customer.orders

    render json: orders, status: :ok, each_serializer: OrderSerializer
  end

  def create
    order = CreateOrder.new(customer: @customer, order_params: order_params).call!

    render json: order, status: :created, serializer: OrderSerializer
  end

  private

  rescue_from CreateOrder::InsufficientInventoryError,
              CreateOrder::MissingParameterError do |error|

    render json: { message: error.message }, status: error.message.split(',')[1]
  end

  def get_customer
    @customer = Customer.find(params[:customer_id])
  end

  def order_params
    params.require(:order).permit(:sku)
  end
end

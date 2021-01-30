class Customers::OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :get_customer

  def index
    orders = @customer.orders

    render json: orders, status: :ok, each_serializer: OrderSerializer
  end

  def create
    order = @customer.orders.create!(order_params)

    render json: order, status: :created, serializer: OrderSerializer
  end

  private

  def get_customer
    @customer = Customer.find(params[:customer_id])
  end

  def order_params
    params.require(:order).permit(:sku)
  end
end

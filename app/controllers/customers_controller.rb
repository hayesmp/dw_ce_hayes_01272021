class CustomersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    customer = Customer.find(params[:id])

    render json: customer, status: :ok, serializer: CustomerSerializer
  end

  def create
    customer = Customer.create!(customer_params)

    render json: customer, status: :created, serializer: CustomerSerializer
  end

private

  def customer_params
    params.require(:customer).permit(:name, :email)
  end
end

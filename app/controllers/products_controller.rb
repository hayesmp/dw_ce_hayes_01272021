class ProductsController < ApplicationController
  def index
    products = Product.all

    render json: products, status: :ok, each_serializer: ProductSerializer
  end
end

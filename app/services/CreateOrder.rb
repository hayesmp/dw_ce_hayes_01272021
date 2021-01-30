class CreateOrder
  class InsufficientInventoryError < StandardError; end
  class MissingParameterError < StandardError; end

  def initialize(options = {})
    @customer           = options[:customer]
    @order_params       = options[:order_params]
    @product            = Product.find_by(sku: @order_params[:sku])
    @requested_quantity = options[:quantity] || 1
    @order
  end

  def call!
    if @customer.nil? || @order_params.nil? || @product.nil?
      raise MissingParameterError, "Customer and/or sku parameters missing, 400"
    end
    if insufficient_quantity?
      raise InsufficientInventoryError, "Insufficient quantity for #{@product.name}, 422"
    else
      ActiveRecord::Base.transaction do
        @order = @customer.orders.create!(@order_params)
        decrement_product_quantity
      end
    end
    return @order
  end

  def insufficient_quantity?
    @requested_quantity > @product.quantity
  end

  def decrement_product_quantity
    new_quantity = @product.quantity - @requested_quantity
    @product.update!(quantity: new_quantity)
  end
end

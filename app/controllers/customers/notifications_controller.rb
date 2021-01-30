class Customers::NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :get_customer

  def index
    notifications = @customer.notifications

    render json: notifications, status: :ok, each_serializer: NotificationSerializer
  end

  def create
    notification = @customer.notifications.create(notification_params)

    render json: notification, status: :created, serializer: NotificationSerializer
  end

  private

  def get_customer
    @customer = Customer.find(params[:customer_id])
  end

  def notification_params
    params.require(:notification).permit(:sku)
  end
end

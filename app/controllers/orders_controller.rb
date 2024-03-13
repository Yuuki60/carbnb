class OrdersController < ApplicationController
  before_action :set_car, only: [:create]

  def index
    @orders = Order.where(user: current_user)
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.car = @car
    if @order.save!
      redirect_to orders_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:start_date, :end_date)
  end

  def set_car
    @car = Car.find(params[:car_id])
  end
end

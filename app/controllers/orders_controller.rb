class OrdersController < ApplicationController
  before_action :set_order, only: [:cancel_order, :decline_order, :accept_order]

  def index
    @orders = Order.where(user: current_user).order(start_date: :asc)
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.car = Car.find(params[:car_id])
    if @order.save
      redirect_to orders_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def cancel_order
    @order.update!(state: 3)
    redirect_to orders_path
  end

  def accept_order
    @order.update!(state: 1)
    redirect_to orders_path
  end

  def decline_order
    @order.update!(state: 2)
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:start_date, :end_date, :state)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end

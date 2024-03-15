class CarsController < ApplicationController
  def index
    @cars = Car.all
    sort_cars if params[:sort].present?
  end

  def new
    @car = Car.new
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    redirect_to car_path(@car)
  end

  def create
    @car = Car.new(car_params)
    @user = current_user
    @car.user = @user
    @car.save
    redirect_to car_path(@car)
  end

  def show
    @car = Car.find(params[:id])
    @order = Order.new
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path, status: :see_other
  end

  private

  def sort_cars
    case params[:sort]
    when 'price_asc'
      @cars = @cars.order(price_per_day: :asc)
    when 'price_desc'
      @cars = @cars.order(price_per_day: :desc)
    when 'location_asc'
      @cars = @cars.order(location: :asc)
    when 'location_desc'
      @cars = @cars.order(location: :desc)
    end
  end

  def car_params
    params.require(:car).permit(:name, :description, :text, :price_per_day, :new_image, :location)
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @cars = Car.search_by_name_and_location(params[:query])

    if params[:startdate].present? && params[:enddate].present?
      if params[:query] == ''
        @cars = Car.all
      end

      start_date = Date.parse(params[:startdate])
      end_date = Date.parse(params[:enddate])

      @cars = @cars.where.not(id: Order.where("start_date <= ? AND end_date >= ?", end_date, start_date).select(:car_id))
    end

    @cars = @cars.limit(3)

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "partials/search_result", locals: { cars: @cars }, formats: [:html] }
    end
  end
end

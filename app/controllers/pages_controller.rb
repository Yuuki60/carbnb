class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @cars = Car.search_by_name(params[:query]).limit(3)
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: "partials/search_result", locals: { cars: @cars }, formats: [:html] }
    end
  end
end

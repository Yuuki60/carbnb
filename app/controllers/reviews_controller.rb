class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.car = Car.find(params[:car_id])

    if @review.save
      redirect_to car_path(params[:car_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to car_path(params[:car_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end

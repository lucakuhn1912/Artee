class ReviewsController < ApplicationController
  def create
    @review = Review.new(params.require(:review).permit(:content, :rating))
    authorize @review
    @art = Art.find(params[:art_id])
    @review.art = @art
    @review.user_id = current_user
    if @review.save
      redirect_to art_path(@art)
    else
      render "art/show"
    end
  end
end

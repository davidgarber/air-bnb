class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @review = @listing.reviews.new
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @review = @listing.reviews.new(review_params)
    if @review.save
      redirect_to listing_path(@review.listing)
    else
      render :new
    end
  end

  private
    def review_params
      params.require(:review).permit(:review)
    end
  end

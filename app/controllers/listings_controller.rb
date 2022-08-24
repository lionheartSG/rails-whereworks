class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index home]

  def home
    @listing = Listing.new
    authorize @listing
    @listings = policy_scope(Listing)
  end

  def index
    @listings = policy_scope(Listing)
  end

  def show
    @listing = Listing.find(params[:id])
    authorize @listing
  end

  def new
    @listing = Listing.new
    authorize @listing
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    authorize @listing
    if @listing.save
      redirect_to listings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def listing_params
    params.require(:listing).permit(%i[name address listing_type booking_type description price zone])
  end
end

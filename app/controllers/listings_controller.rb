class ListingsController < ApplicationController

  def show
    @listing = Listing.find(params[:id])
    authorize @listing
  end

  def new
    @listing = Listing.new
    authorize @listing
  end

  def create
    @listing = listing.new(listing_params)
    @listing.user = current_user
    authorize @listing
    # if @listing.save
  end

  private

  def listing_params
    params.require(:listing).permit(%i[name address listing_type booking_type description price zone])
  end
end

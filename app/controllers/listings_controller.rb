class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index home show]

  def home
    @listing = Listing.new
    authorize @listing
    @listings = policy_scope(Listing)
    @time = Time.now.strftime('%H:%M')
    arr = @time.split(':')
    arr[0] = arr[0].to_i
    arr[0] += 2
    @newtime = "#{arr[0]}:".concat(arr[1])
  end

  def index
    @listings = policy_scope(Listing)
    unless params[:listing].nil?
      if Listing.near(params[:listing][:address], 2).present?
        @listings = Listing.near(params[:listing][:address], 2)
      else
        flash[:alert] = 'No results found!'
      end
    @user = current_user
    @markers = @listings.geocoded.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude,
        info_window: render_to_string(partial: "info_window", locals: { listing: listing })
      }
    end
  end

  def show
    @listing = Listing.find(params[:id])
    authorize @listing
    @booking = Booking.new
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
    params.require(:listing).permit(:name, :address, :listing_type, :booking_type, :description, :price, photos: [])
  end
end

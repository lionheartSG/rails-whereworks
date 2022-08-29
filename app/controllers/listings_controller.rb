class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index home show]

  def home
    @listing = Listing.new
    authorize @listing
    @listings = policy_scope(Listing)
    @markers = @listings.geocoded.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude,
        info_window: render_to_string(partial: "info_window", locals: { listing: listing })
      }
    end

    if user_signed_in?
      @user_listings = current_user.listings
      @pending = []
      @user_listings.each do |listing|
        listing.bookings.each do |booking|
          if booking.status == "Pending"
            @pending << booking
          end
        end
      end
    end
  end

  def index
    @listings = policy_scope(Listing)

    unless params[:listing].nil?

      @listings = Listing.near(params[:listing][:address], 2) if params[:listing][:address].present?

      if params[:listing][:min].present? && params[:listing][:max].present?
        min = params[:listing][:min].to_i
        max = params[:listing][:max].to_i

        @listings = if Listing.near(params[:listing][:address], 2).present?
                      Listing.near(params[:listing][:address], 2).where("price >= ?", min).where("price <= ?", max)
                    else
                      Listing.where("price >= ?", min).where("price <= ?", max)
                    end
      end
    end

    if @listings.empty?
      @listings = policy_scope(Listing)

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
    @time = Time.now.strftime('%H:%M:%S')
    arr = @time.split(':')
    arr[0] = arr[0].to_i
    arr[0] += 2
    @newtime = "#{arr[0]}:".concat(arr[1])

    @comments = []
    @ratings = []

    @listing.bookings.each do |booking|
      @comments << booking.listing_review.listing_comment
      @ratings << booking.listing_review.listing_rating
    end
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

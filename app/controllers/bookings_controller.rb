class BookingsController < ApplicationController
  # before_action :set_listing, only: %i[create new]

  # def create
  #   @booking = Booking.new(booking_params)
  #   @booking.listing = @listing
  #   if @booking.listing = @listing
  #     redirect_to listing_path(@listing)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # def new
  #   @booking = Booking.new
  # end



  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    listing = Listing.find(params[:listing_id])
    @booking.user = current_user
    @booking.listing = listing
    authorize @booking
    if @booking.save
      redirect_to user_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def confirm
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = params[:status]
    @booking.save!
    redirect_to user_path(current_user)
  end

  def cancel
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = params[:status]
    @booking.save!
    redirect_to user_path(current_user)
  end

private

  # def set_listing
  #   @listing = Listing.find(params[:listing_id])
  # end

  def booking_params
    params.require(:booking).permit(:quantity, :reservation_startdatetime, :reservation_enddatetime, :status)
  end
end

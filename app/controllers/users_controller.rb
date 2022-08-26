class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show bookings listings]

  def bookings
    if user_signed_in?
      @user = current_user
      authorize @user
      @active = @user.bookings.where(status: "Active")
      @pending = @user.bookings.where(status: "Pending")
      @completed = @user.bookings.where(status: "Completed")
    else
      redirect_to root_path
    end
  end

  def listings
    if user_signed_in?
      @user = current_user
      @listings = @user.listings
      @pending = []
      authorize @user
      @listings.each do |listing|
        listing.bookings.each do |booking|
          if booking.status == "Pending"
            @pending << booking
          end
        end
      end
    else
      redirect_to root_path
    end

  end

  def show
    @user = User.find(params[:id])
    authorize @user
    # @user.update(user_params)
    # redirect_to user_path(@user)
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:photo)
  end
end

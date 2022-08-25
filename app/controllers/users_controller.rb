class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]

  def show
    if user_signed_in?
      @user = current_user
      authorize @user
      @active = @user.bookings.where(status: "Active")
      @pending = @user.bookings.where(status: "Pending")
      @completed = @user.bookings.where(status: "Completed")
      raise
    else
      redirect_to root_path
    end
  end
end

class RemoveReservationStartDatetimeAndReservationEndDatetimeFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :reservation_startdatetime, :string
    remove_column :bookings, :reservation_enddatetime, :string
  end
end

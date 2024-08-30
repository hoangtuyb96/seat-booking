class BookingsController < ApplicationController
  def new
    @seat = Seat.find_by(id: params[:seat_id])
    @booking = current_user.bookings.new
    @seat_name = Seat.find(params[:seat_id]).name if params[:seat_id]
  end

  def create
    # One user can only book one seat at a time
    # If the user has a booking, redirect to the booking page
    if current_user.bookings.any?
      redirect_to seats_path, notice: 'You already have a booking. You can only book one seat at a time.'
    else
      @booking = current_user.bookings.new(booking_params)
      if @booking.save
        redirect_to seats_path, notice: 'Booking was successfully created.'
      else
        redirect_to new_booking_path(seat_id: @booking.seat_id)
      end
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:seat_id, :from_date, :to_date, :check_in)
  end
end

class BookingsController < ApplicationController
  def new
    @seat = Seat.find_by(id: params[:seat_id])
    @booking = current_user.bookings.new
  end

  def create
    # One user can only book one seat at a time
    # If the user has a booking, redirect to the booking page
    if current_user.bookings.any?
      redirect_to current_user.bookings.first, notice: 'You can only book one seat at a time.'
    else
      @booking = current_user.bookings.new(booking_params)
      if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created.'
      else
        render seats_path
      end
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:seat_id, :from_date, :to_date, :check_in)
  end
end

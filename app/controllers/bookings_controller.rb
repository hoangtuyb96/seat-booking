class BookingsController < ApplicationController
  def new
    @seat = Seat.find_by(id: params[:seat_id])
    @booking = current_user.bookings.new
  end

  def create
    @booking = current_user.bookings.new(booking_params)
    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      render seats_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:seat_id, :from_date, :to_date, :check_in)
  end
end

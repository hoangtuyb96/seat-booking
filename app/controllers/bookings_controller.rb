class BookingsController < ApplicationController
  def new
    @booking = current_user.bookings.new
    @seat_name = Seat.find(params[:seat_id]).name if params[:seat_id]
  end

  def create
    @booking = current_user.bookings.new(booking_params)
    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:seat_id, :from_date, :to_date, :check_in)
  end
end

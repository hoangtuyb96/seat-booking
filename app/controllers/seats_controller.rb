class SeatsController < ApplicationController
  def index
    @seats = Seat.includes(:bookings).all
    @have_booking = current_user.bookings.any?
  end
end

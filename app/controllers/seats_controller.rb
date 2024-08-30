class SeatsController < ApplicationController
  def index
    @seats = Seat.includes(:bookings).all
  end
end

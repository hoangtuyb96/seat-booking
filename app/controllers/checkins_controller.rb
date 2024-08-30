class CheckinsController < ApplicationController

  def new
  end

  def create
    booked = Booking.find_by(user_id: current_user.id, seat_id: params[:seat_id])

    if booked.nil?
      redirect_to root_path, alert: 'You have not booked this seat'
      return 
    end

    if Time.now <= booked.from_date + 10.minutes
      booked.check_in = true

      if booked.save
        seat = Seat.find(params[:seat_id])
        redirect_to root_path, notice: "Check-in seat #{seat.name} successful"
        return
      else
        redirect_to root_path, alert: 'Your booking has been cancelled because the check-in link expired.'
        return
      end
    else
      booked.destroy
    end

    redirect_to root_path, alert: 'Check-in link expired'
  end
end

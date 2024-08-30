class CheckinsController < ApplicationController

  def new
  end

  def create
    booked = Booking.find_by(user_id: current_user.id, seat_id: params[:seat_id])

    if booked.from_date + 10.minutes <= Time.now
      booked.check_in = true

      if booked.save
        redirect_to root_path, notice: 'Check-in successful'
        return
      else
        redirect_to root_path, notice: 'Check-in failed'
        return
      end
    end

    redirect_to root_path, notice: 'Check-in link expired'
  end
end

class RidesController < ApplicationController
  def create
    ride = Ride.create(ride_params)
    rejection_reason = ride.take_ride
    if rejection_reason
      redirect_to user_path(ride.user), alert: rejection_reason
    else
      redirect_to user_path(ride.user), notice: "Thanks for riding the #{ride.attraction.name}!"
    end
  end

  private
  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end

class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    rejection_reason = check_for_rejections
    return rejection_reason if rejection_reason
    update_user
    return nil
  end

  private
  def check_for_rejections
    rejection = ""
    rejection += " " + "You do not have enough tickets to ride the #{self.attraction.name}." if self.user.tickets < self.attraction.tickets
    rejection += " " + "You are not tall enough to ride the #{attraction.name}." if self.user.height < self.attraction.min_height

    if !rejection.empty?
      return "Sorry." + rejection
    else
      return nil
    end
  end

  def update_user
    self.user.take_ride(self.attraction)
  end
end

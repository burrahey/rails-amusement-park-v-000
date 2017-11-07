class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  def take_ride(attraction)
    self.nausea += attraction.nausea_rating
    self.happiness += attraction.happiness_rating
    self.tickets -= attraction.tickets
    self.save
  end

  def mood
    if self.happiness > self.nausea
      return 'happy'
    else
      return 'sad'
    end
  end
end

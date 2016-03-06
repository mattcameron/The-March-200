class Run < ActiveRecord::Base
  before_save :calc_speed

  private 

  def calc_speed
    self.speed = (time / distance)
  end
end

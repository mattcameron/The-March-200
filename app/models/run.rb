class Run < ActiveRecord::Base
  before_save :calc_speed

  validates :time, :distance, :date, presence: true

  private 

  def calc_speed
    self.speed = time / distance
  end
end

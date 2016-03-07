module RunsHelper

  def run_total(attr)
    Run.sum(attr.to_sym)
  end

  def minutes_per_km(speed)
    seconds = (speed % 60).floor
    minutes = ((speed / 60) % 60).floor

    "#{minutes}:#{seconds} mins/km"
  end

  def human_time(seconds)
    Time.at(seconds).utc.strftime("%k:%M:%S")
  end

  def average_speed
    time = Run.sum(:time)
    distance = Run.sum(:distance)
    speed = time / distance

    minutes_per_km(speed)
  end
end

module RunsHelper

  def run_total(attr)
    Run.sum(attr.to_sym)
  end

  def minutes_per_km(speed)
    seconds = (speed % 60).floor
    minutes = ((speed / 60) % 60).floor

    # pad out if necessary
    seconds = padded(seconds)
    # minutes = padded(minutes)
    "#{minutes}:#{seconds} mins/km"
  end

  def human_time(seconds)
    seconds >= (3600) ? Time.at(seconds).utc.strftime("%k:%M:%S") : Time.at(seconds).utc.strftime("%M:%S")
  end

  def average_speed
    time = Run.sum(:time)
    distance = Run.sum(:distance)
    speed = time / distance

    minutes_per_km(speed)
  end

  def padded(x)
    x.to_s.length == 1 ? "0"+x.to_s : x.to_s
  end

end


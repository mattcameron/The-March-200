module RunsHelper

  def run_total(attr)
    Run.sum(attr.to_sym)
  end

  def minutes_per_km(speed)
    seconds = (speed % 60).floor
    minutes = ((speed / 60) % 60).floor

    "#{minutes}:#{seconds} per km"
  end
end

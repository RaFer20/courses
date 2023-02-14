class Clock
  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes=0)
    new(hours, minutes)
  end

  def +(minutes)
    time = compute_minutes_since_midnight + minutes
    while time >= 24*60
      time -= 24*60
    end
    compute_time_from_minutes_since_midnight(time)
  end

  def -(minutes)
    time = compute_minutes_since_midnight - minutes
    while time < 0
      time += 24*60
    end
    compute_time_from_minutes_since_midnight(time)
  end

  def ==(other)
    @hours == other.hours && @minutes == other.minutes
  end

  def to_s
    # h = hours.to_s
    # h.prepend('0') if hours < 10
    # m = minutes.to_s
    # m.prepend('0') if minutes < 10
    # "#{h}:#{m}"
    format('%02d:%02d', hours, minutes)
  end

  def compute_minutes_since_midnight
    60*hours + minutes
  end

  def compute_time_from_minutes_since_midnight(time)
    @hours, @minutes = time.divmod(60)
    self.class.new(hours, minutes)
  end

  protected

  attr_reader :hours, :minutes
end
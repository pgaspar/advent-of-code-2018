class Guard
  attr_reader :id, :shifts

  def initialize(guard_id, shifts)
    @id = guard_id
    @shifts = shifts
  end

  def most_slept_minute
    minutes_asleep.max_by { |minute| minutes_asleep.count(minute) }
  end

  def total_minutes_asleep
    minutes_asleep.size
  end

  def most_slept_minute_frequency
    minutes_asleep.count(most_slept_minute)
  end

  private

  def minutes_asleep
    @minutes_asleep ||= shifts.flat_map(&:minutes_asleep)
  end
end

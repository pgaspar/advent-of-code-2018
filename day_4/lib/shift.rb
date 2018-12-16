class Shift
  def initialize(logs)
    @logs = logs
  end

  def guard_id
    logs.first.guard_id
  end

  def minutes_asleep
    sleep_periods.flat_map do |asleep, awake|
      (asleep.minute...awake.minute).to_a
    end
  end

  private

  def sleep_periods
    logs.drop(1).each_slice(2)
  end

  attr_reader :logs
end

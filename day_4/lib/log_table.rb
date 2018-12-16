require_relative 'log'
require_relative 'shift'
require_relative 'guard'

class LogTable
  def initialize(raw_log_table)
    @log_list = raw_log_table.map { |log_line| Log.new(log_line) }
    @log_list.sort_by!(&:time)
  end

  def sleepiest_guard
    guards.max_by(&:total_minutes_asleep)
  end

  def guard_with_longest_slept_minute_streak
    guards.max_by(&:most_slept_minute_frequency)
  end

  private

  attr_reader :log_list

  def shifts
    @shifts ||= log_list.slice_before(&:new_shift?).map do |logs|
      Shift.new(logs)
    end
  end

  def guards
    @guards ||= shifts.group_by(&:guard_id).map do |guard_id, shifts|
      Guard.new(guard_id, shifts)
    end
  end
end

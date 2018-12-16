require_relative 'lib/log_table'

input = open("#{__dir__}/input.txt").readlines.map(&:strip)
log_table = LogTable.new(input)

guard = log_table.sleepiest_guard
puts "Part 1: #{guard.id * guard.most_slept_minute}"

guard = log_table.guard_with_longest_slept_minute_streak
puts "Part 2: #{guard.id * guard.most_slept_minute}"

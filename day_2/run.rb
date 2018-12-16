require_relative 'lib/box_id.rb'
require_relative 'lib/prototype_box_finder.rb'

input = open("#{__dir__}/input.txt").readlines.map(&:strip)
ids = input.map { |line| BoxId.new(line) }

two_times = ids.count { |id| id.repeated_chars?(2) }
three_times = ids.count { |id| id.repeated_chars?(3) }

puts "Part 1: #{two_times * three_times}"

prototype_one, prototype_two = PrototypeBoxFinder.new(ids).find

puts "Part 2: #{prototype_one.common_letters(prototype_two)}"

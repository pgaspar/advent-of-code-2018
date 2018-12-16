require_relative 'lib/claim'
require_relative 'lib/fabric_matrix'

input = open("#{__dir__}/input.txt").readlines.map(&:strip)
claims = input.map { |line| Claim.new(line) }

matrix = FabricMatrix.new
claims.each { |c| matrix.add_claim(c) }
puts "Part 1: #{matrix.count_overlapping}"

claim = claims.find { |c| !matrix.overlapping?(c) }
puts "Part 2: #{claim.id}"

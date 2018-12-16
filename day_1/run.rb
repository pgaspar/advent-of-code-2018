input = open("#{__dir__}/input.txt").readlines.map(&:strip)
input.map!(&:to_i)

puts "Part 1: #{input.sum}"

def find_first_repetition(input)
  hash = {}
  sum = 0

  loop do
    input.each do |el|
      sum += el
      return sum if hash[sum]
      hash[sum] = true
    end
  end
end

puts "Part 2: #{find_first_repetition(input)}"

class Claim
  LINE_REGEX = /#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/

  def initialize(line)
    # #1 @ 258,327: 19x22
    @id, @left, @top, @width, @height = line.match(LINE_REGEX).captures.map(&:to_i)
  end

  attr_reader :id, :left, :top, :width, :height
end

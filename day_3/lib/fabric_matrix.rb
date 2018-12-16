class FabricMatrix
  def initialize(width: 1000, height: 1000)
    @matrix = Array.new(height) do
      Array.new(width, 0)
    end
  end

  def add_claim(claim)
    (0...claim.width).each do |x|
      (0...claim.height).each do |y|
        matrix[claim.left + x][claim.top + y] += 1
      end
    end
  end

  def count_overlapping
    matrix.sum do |line|
      line.count { |c| c > 1 }
    end
  end

  def overlapping?(claim)
    (0...claim.width).any? do |x|
      (0...claim.height).any? do |y|
        matrix[claim.left + x][claim.top + y] > 1
      end
    end
  end

  private

  attr_reader :matrix
end

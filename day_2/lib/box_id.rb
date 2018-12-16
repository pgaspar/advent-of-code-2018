class BoxId
  def initialize(identifier)
    @id = identifier
  end

  def repeated_chars?(repetitions = 2)
    frequency.any? { |_, v| v.size == repetitions }
  end

  def similar_to?(other)
    id.chars.zip(other.id.chars)
      .count { |a, b| a != b } == 1
  end

  def common_letters(other)
    id.chars.zip(other.id.chars)
      .select { |a, b| a == b }
      .map(&:first)
      .join
  end

  protected

  attr_reader :id

  private

  def frequency
    @frequency ||= id.chars.group_by(&:itself)
  end
end

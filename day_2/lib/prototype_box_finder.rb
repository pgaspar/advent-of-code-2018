class PrototypeBoxFinder
  def initialize(ids)
    @ids = ids
  end

  def find
    comparable_id_pairs.find do |id, other_id|
      id.similar_to?(other_id)
    end
  end

  private

  attr_reader :ids

  def comparable_id_pairs
    ids.combination(2)
  end
end

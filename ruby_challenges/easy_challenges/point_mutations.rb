class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(strand_b)
    shortest = @strand.size < strand_b.size ? (@strand.length - 1) : (strand_b.length - 1)
    mutations = 0

    0.upto(shortest) do |idx|
      mutations += 1 if @strand[idx] != strand_b[idx]
    end

    mutations
  end
end



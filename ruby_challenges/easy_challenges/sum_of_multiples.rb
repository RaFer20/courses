class SumOfMultiples
  def initialize(*numbers)
    @numbers = numbers
  end

  def to(target)
    multiples = []

    @numbers.each do |num|
      multiple = num
      while multiple < target
        multiples << multiple
        multiple += num
      end
    end
    multiples.uniq.sum
  end

  def self.to(target)
    SumOfMultiples.new(3, 5).to(target)
  end
end

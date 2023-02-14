class Triangle

  def initialize(side_a, side_b, side_c)
    @sides = [side_a, side_b, side_c]

    raise ArgumentError,
    "The length of each side must be larger than 0" if sides.any?{|side| side <= 0}
    raise ArgumentError,
    "The sum of the two shortest lengths must be larger than the third" unless sides.min(2).inject(:+) > sides.max    
  end

  def kind
    if sides.uniq.size == 1
      'equilateral'
    elsif sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end

  private

  attr_reader :sides
end
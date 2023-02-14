class Octal
  def initialize(octal)
    @octal = octal.split('')
  end

  def to_decimal
    return 0 if invalid_number
    e = 0
    decimal = []
    octal.reverse_each{|digit| decimal << digit.to_i * (8**e); e += 1}
    decimal.sum
  end

  private

  attr_reader :octal

  def invalid_number
    octal.any?{|char| !('0'..'7').to_a.include?(char)}
  end
end

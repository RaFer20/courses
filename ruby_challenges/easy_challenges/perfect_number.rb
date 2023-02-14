class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 1
    divisors = []

    1.upto(number-1) do |divisor|
      divisors << divisor if number % divisor == 0
    end

    if divisors.sum > number
      'abundant'
    elsif divisors.sum < number
      'deficient'
    else
      'perfect'
    end
  end
end

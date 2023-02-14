class RomanNumeral

  def initialize(number)
    @number = number
    @numerals = { "I" => 1, "IV" => 4, "V" => 5, "IX" => 9, "X" => 10, "XL" => 40, "L" => 50,
                   "XC" => 90, "C" => 100, "CD" => 400, "D" => 500, "CM" => 900, "M" => 1000}
    @roman = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  end


  def to_roman
    conversion = ''

    @roman.each do |numeral|
      if @numerals[numeral] <= @number
        until @numerals[numeral] > @number
        conversion << numeral
        @number -= @numerals[numeral]
        end
      end
    end
  conversion
  end
end


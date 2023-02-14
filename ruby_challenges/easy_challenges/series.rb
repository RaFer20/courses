class Series
  attr_reader :num_str

  def initialize(num_str)
    @num_str = num_str
  end

  def slices(digits)
    raise ArgumentError if digits > num_str.length
    result = []

    
    num_str.split('').each_cons(digits) do |slice|
      valid_slice = []
      slice.each{|char| valid_slice << char.to_i}
      result << valid_slice
    end
    result
  end
end
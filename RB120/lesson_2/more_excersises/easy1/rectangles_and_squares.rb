=begin
Given the following class:
class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

Write a class called Square that inherits from Rectangle, and is used like this:
square = Square.new(5)
puts "area of square = #{square.area}"
=end
class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
  def initialize(side)
    super(side, side)
  end
end

### OR
# class Square < Rectangle
#   def initialize(side)
#     @side = side
#   end
#   def area
#     self.side**2
#   end

#   private
#   attr_reader :side
# end

square = Square.new(5)
puts "area of square = #{square.area}"

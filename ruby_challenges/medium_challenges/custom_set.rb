class CustomSet
  def initialize(array=[])
    @array = array.uniq
  end

  def empty?
    @array.length == 0
  end

  def intersection(other)
    intersection = []
    array.each{|n| intersection << n if other.array.include?(n)}
    CustomSet.new(intersection)
  end

  def union(other)
    union = CustomSet.new(array)
    other.array.each{|element| union.add(element)}
    union
  end

  def difference(other)
    CustomSet.new(array.select{|element| !other.array.include?(element)})
  end

  def disjoint?(other)
    !array.any?{|element| other.array.include?(element)}
  end

  def eql?(other)
    return false if array.size != other.array.size
    array.all?{|element| other.array.include?(element)}
  end

  def subset?(other)
    array.all?{|element| other.array.include?(element)}
  end

  def add(element)
    array.push(element) if !array.include?(element)
    self
  end

  def contains?(element)
    array.include?(element)
  end

  def ==(other)
    array.sort == other.array.sort
  end

  protected

  attr_reader :array
end

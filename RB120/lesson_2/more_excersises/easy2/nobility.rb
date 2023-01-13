=begin
Now that we have a Walkable module, we are given a new challenge. 
Apparently some of our users are nobility, and the regular way of walking simply isn't good enough. 
Nobility need to strut.

We need a new class Noble that shows the title and name when walk is called:
byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"

We must have access to both name and title because they are needed for other purposes that we aren't showing here.
byron.name
=> "Byron"
byron.title
=> "Lord"
=end
module Walkable
  def walk
    puts self.to_s + " forward"
  end
end

class Person
  include Walkable
  attr_reader :name
  
  def initialize(name)
    @name = name
  end

  private
  def to_s
    "#{name} #{gait}"
  end
  def gait
    "strolls"
  end
end

class Cat
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private
  def to_s
    "#{name} #{gait}"
  end
  def gait
    "saunters"
  end
end

class Cheetah < Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private
  def gait
    "runs"
  end
end

class Noble
  include Walkable
  attr_reader :name, :title

  def initialize(name, title)
    @name = name
    @title = title
  end

  private
  def to_s
    "#{title} #{name} #{gait}"
  end
  def gait
    "struts"
  end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"

byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"
byron.name
#=> "Byron"
byron.title
#=> "Lord"
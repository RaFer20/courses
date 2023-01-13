class Wedding
  attr_reader :guests, :flowers, :songs

  def prepare(preparers)
    preparers.each do |preparer|
      preparer.prepare_wedding(self)
    end
  end
end

class Chef
  def prepare_wedding(wedding)
    prepare_food(wedding.guests)
  end

  def prepare_food(guests)
    #implementation
  end
end

class Decorator
  def prepare_wedding(wedding)
    decorate_place(wedding.flowers)
  end

  def decorate_place(flowers)
    # implementation
  end
end

class Musician
  def prepare_wedding(wedding)
    prepare_performance(wedding.songs)
  end

  def prepare_performance(songs)
    #implementation
  end
end

=begin
Though there is no inheritance in this example, each of the preparer-type classes provides a prepare_wedding method. 
We still have polymorphism since all of the objects respond to the prepare_wedding method call. 
If we later need to add another preparer type,
we can create another class and implement the prepare_wedding method to perform the appropriate actions.
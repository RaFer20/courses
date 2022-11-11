# If I have the following class:
class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# Which one of these is a class method (if any) and how do you know? How would you call a class method?

# `self.manufacturer` is a class method, we know this because it starts with `self` so it's being called on the class itself
# To call it we'd do the following:
Television.manufacturer
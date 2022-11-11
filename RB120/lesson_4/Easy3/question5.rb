# If I have the following class:
class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer
tv.model

Television.manufacturer
Television.model

###
# `tv.manufacturer` and `Television.model` would raise exceptions
# `self.manufacturer` is a class method and can only be called on the `Television` class
# `model` is an instance method and can only be called on instances of the `Television` class
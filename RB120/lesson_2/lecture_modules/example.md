One of the limitations of class inheritance in Ruby is that a class can only directly sub-class from one super class. We call this single inheritance. In some situations, this limitation makes it very difficult to accurately model the problem domain. For example, suppose we have a new pet animal called Fish. These are pets that can swim, and have other characteristics like living in a small bowl, etc. They also can't run or jump, which are methods in our Pet class.

Some programming languages allow classes to directly inherit from multiple classes, a functionality known as multiple inheritance. Ruby's answer to multiple inheritance is by way of mixing in behaviors. A class can only sub-class from one parent, but it can mix in as many modules as it likes.

module Swim
  def swim
    "swimming!"
  end
end

class Dog
  include Swim
  # ... rest of class omitted
end

class Fish
  include Swim
  # ... rest of class omitted
end

The result is that all the instance methods defined in the Swim module are now ready for use in the Dog and Fish classes. It's as if we copied and pasted the methods right in. We can also mix in as many modules as we need to. Mixing in modules, though, does affect the method lookup path. 

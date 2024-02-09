# *Testing Equality*
When we use assert_equal, we are testing for value equality. Specifically, we're invoking the == method on the object. If we're looking for more strict object equality, then we need to use the assert_same assertion.

## *Example*

```ruby
require 'minitest/autorun'

class EqualityTest < Minitest::Test
  def test_value_equality
    str1 = "hi there"
    str2 = "hi there"

    assert_equal(str1, str2)
    assert_same(str1, str2)
  end
end
```

In the test above the `assert_equal` assertion will pass because it's checking that str1 == str2. The second assertion `assert_same` however, will fail, this is because it's checking it str1 and str2 are the same object. 
It will output the following message:
```ruby
1) Failure:
EqualityTest#test_value_equality [temp.rb:9]:
Expected "hi there" (oid=70321861410720) to be the same as "hi there" (oid=70321861410740).
```


# *Equality with a custom class*

Because the Ruby core library classes all implement sensible `==` to test for value equality, we can get away with using assert_equal on strings, arrays, hashes, etc. On custom classes we must implement our own `==` method.

If we dont:
```ruby
class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end
end

class CarTest < MiniTest::Test
  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = "Kim"
    car2.name = "Kim"

    assert_equal(car1, car2)
  end
end
```

We get this:
```ruby
# Running:

CarTest F

Finished in 0.021080s, 47.4375 runs/s, 47.4375 assertions/s.

  1) Failure:
CarTest#test_value_equality [car_test.rb:48]:
No visible difference in the Car#inspect output.
You should look at the implementation of #== on Car or its members.
#<Car:0xXXXXXX @wheels=4, @name="Kim">

1 runs, 1 assertions, 1 failures, 0 errors, 0 skips
```

The message tells us we need to implement `==` in `Car`; Otherwise Minitest doesn't know how to assert value equality here.

```ruby
class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end

  def ==(other)                       # assert_equal would fail without this method
    other.is_a?(Car) && name == other.name
  end
end
```
We can now call assert_equal on Car objects.

```ruby
class CarTest < MiniTest::Test
  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = "Kim"
    car2.name = "Kim"

    assert_equal(car1, car2)          # this will pass
    assert_same(car1, car2)           # this will fail
  end
end
```
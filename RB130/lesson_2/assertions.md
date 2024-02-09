https://ruby-doc.org/stdlib-3.0.0/libdoc/minitest/rdoc/Minitest/Assertions.html -List of assertions

`assert_equal` is the most common assertion, and we can get pretty far only using that.
But there are times when we need to make different types of assertions. For example, besides equality, sometimes we want to assert that a specific error is raised, or that something is printed out to standard out, or an object must be an object of a specific class, or that something must be nil, or that it must not be nil, etc. Minitest can support virtually every kind of assertion you'd want to make.

*Assertion*                          *Description*

assert(test)	                        Fails unless test is truthy.
assert_equal(exp, act)	              Fails unless exp == act.
assert_nil(obj)	                      Fails unless obj is nil.
assert_raises(*exp) { ... }	          Fails unless block raises one of *exp.
assert_instance_of(cls, obj)	        Fails unless obj is an instance of cls.
assert_includes(collection, obj)	    Fails unless collection includes obj.


# Examples
```ruby
class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end
end
```

1. `assert`

```ruby
def test_car_exists
  car = Car.new
  assert(car)
end
```

2. `assert_equal`
```ruby
def test_wheels
  car = Car.new
  assert_equal(4, car.wheels)
end
```

3. `assert_nil`
```ruby
def test_name_is_nil
  car = Car.new
  assert_nil(car.name)
end
```

4.  `assert_raises`
```ruby
def test_raise_initialize_with_arg
  assert_raises(ArgumentError) do
    car = Car.new(name: "Joey")         # this code raises ArgumentError, so this assertion passes
  end
end
```

5. `assert_instance_of`
```ruby
def test_instance_of_car
  car = Car.new
  assert_instance_of(Car, car)
end
```
*This test is more useful when dealing with inheritance. This example is a little contrived.*

6.
```ruby
def test_includes_car
  car = Car.new
  arr = [1, 2, 3]
  arr << car

  assert_includes(arr, car)
end

# assert_includes calls assert_equal in its implementation, and Minitest counts that call
# as a separate assertion. For each assert_includes call, you will get 2 assertions, not 1.
```

# *Refutations*

They are the opposite of assertions. That is, they refute rather than assert. Every assertion has a corresponding refutation. For example, assert's opposite is refute. refute passes if the object you pass to it is falsy. Refutations all take the same arguments, except it's doing a refutation. And yes, there is a `refute_equal`, `refute_nil`, `refute_includes`, etc.
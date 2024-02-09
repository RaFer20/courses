# SEAT Approach

1. Set up the necessary objects.
2. Execute the code against the object we're testing.
3. Assert that the executed code did the right thing.
4. Tear down and clean up any lingering artifacts.

## Example

```ruby
require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test

  def test_car_exists
    car = Car.new
    assert(car)
  end

  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_name_is_nil
    car = Car.new
    assert_nil(car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      car = Car.new(name: "Joey")
    end
  end

  def test_instance_of_car
    car = Car.new
    assert_instance_of(Car, car)
  end

  def test_includes_car
    car = Car.new
    arr = [1, 2, 3]
    arr << car

    assert_includes(arr, car)
  end
end
```

Many of these tests have `car = Car.new`;  This is very redundant, and we should extract this to some set up step that gets executed before the running of every test. In Minitest, we can do this with a setup instance method.

```ruby
require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test
  def setup
    @car = Car.new
  end

  def test_car_exists
    assert(@car)
  end

  def test_wheels
    assert_equal(4, @car.wheels)
  end

  def test_name_is_nil
    assert_nil(@car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      Car.new(name: "Joey")
    end
  end

  def test_instance_of_car
    assert_instance_of(Car, @car)
  end

  def test_includes_car
    arr = [1, 2, 3]
    arr << @car

    assert_includes(arr, @car)
  end
end
```

Note that in the `setup` method, we must now use an instance variable, @car. We can't use a local variable in `setup`, because the tests, which are just instance methods, won't be able to access it. But they can access an instance variable. Because we changed car to @car, we also have to make the same update in the actual tests. Finally, note that we do not use @car in the test_raise_initialize_with_arg test, because we're using Car.new with arguments in this test.

The `setup` method will be called before running each test, and the `teardown` method (which we don't have) will be called after running each test.
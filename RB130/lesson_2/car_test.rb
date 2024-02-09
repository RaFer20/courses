require "minitest/reporters"
Minitest::Reporters.use!
# require 'minitest/autorun'      #  Loads all the necessary files from the `minitest` gem.

# require_relative 'car'          #  We require the file that we're testing, `car.rb`, which contains the `Car` class.
#                                 #  We use require_relative to specify the file name from the current file's directory.  

# class CarTest < MiniTest::Test  # We create our test class. Note that this class must subclass MiniTest::Test. 
#                                 # This will allow our test class to inherit all the necessary methods for writing tests.
#   def test_wheels
#     car = Car.new               # We instantiate a `Car` object
#     assert_equal(4, car.wheels) # We use the car object in our assertion to verify that the `Car` object has 4 wheels.
#   end
# end

=begin
Within our test class, CarTest, we can write tests by creating an instance method that starts with test_. 
Through this naming convention, Minitest will know that these methods are individual tests that need to be run. 
Within each test (or instance method that starts with "test_"), we will need to make some assertions. 
These assertions are what we are trying to verify. Before we make any assertions, however, 
we have to first set up the appropriate data or objects to make assertions against. 
For example, we first instantiate a Car object. 
We then use this car object in our assertion to verify that newly created Car objects indeed have 4 wheels.

There are many types of assertions, but for now, just focus on assert_equal. 
Since we are inside an instance method, you can guess that assert_equal is an inherited instance method from somewhere up the hierarchy. 
assert_equal takes two parameters: the first is the expected value, and the second is the test or actual value. 
If there's a discrepancy, assert_equal will save the error and Minitest will report that error to you at the end of the test run.

It's sometimes useful to have multiple assertions within one test (ie, instance method that starts with "test_"),
but in the beginning, we'll only show one assertion within one test.
=end

# Failure

# require 'minitest/autorun'

# require_relative 'car'

# class CarTest < MiniTest::Test
#   def test_wheels
#     car = Car.new
#     assert_equal(4, car.wheels)
#   end

#   def test_bad_wheels
#     car = Car.new
#     assert_equal(3, car.wheels)
#   end
# end

# Skipping

require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_bad_wheels
    skip # we can pass a string to `skip` to add a custom message
    car = Car.new
    assert_equal(3, car.wheels)
  end
end
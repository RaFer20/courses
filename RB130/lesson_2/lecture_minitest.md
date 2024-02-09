# *Vocabulary*
In the world of testing, a whole new vocabulary is necessary to talk about the new concepts. There is a lot of jargon when working with tests, but for now, we'll just focus on a few terms below.

- *Test Suite:* this is the entire set of tests that accompanies your program or application. You can think of this as all the tests for a project.
- *Test:* this describes a situation or context in which tests are run. For example, this test is about making sure you get an error message after trying to log in with the wrong password. A test can contain multiple assertions.
- *Assertion:* this is the actual verification step to confirm that the data returned by your program or application is indeed what is expected. You make one or more assertions within a test.

# Example

Let's start with a simple `Car` class. Create a file called `car.rb` on your file system; In the same directory, create another file called `car_test.rb`. (code is on those files.)

If you run the test file with ruby car_test.rb, you should see this output:

```ruby
$ ruby car_test.rb

Run options: --seed 62238

# Running:

CarTest .

Finished in 0.001097s, 911.3428 runs/s, 911.3428 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

Though it's not extremely obvious, this output means our test passed. Look at the last line: 1 assertions, 0 failures, 0 errors. That means the assertion was executed, and there weren't any problems. 


# *Reading test output*

```ruby
Run options: --seed 62238

# Running:

CarTest .

Finished in 0.001097s, 911.3428 runs/s, 911.3428 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

There are many options in Minitest, including various formatting options, but by default the output looks like the above. The first "seed" tells Minitest what order the tests were run in. In our example, we only have 1 test, but most test suites have many tests that are run in random order. The "seed" is how you tell Minitest to run the entire test suite in a particular order. This is rarely used, but is sometimes helpful when you have an especially tricky bug that only comes up when certain specific situations come up.

The next important thing to notice is the dot. There's only 1 here, so it looks like an inconsequential period, but it's very important. That means the test was run and nothing went wrong. If you skip a test with the "skip" keyword, it'll say "S". If you have a failure, it'll say "F". Pay attention to that to see if you have a failing test.

# *Failures*

Let's add another test, but purposefully make it fail. (see `car_test.rb`)

```ruby
$ ruby car_test.rb

Run options: --seed 8732

# Running:

CarTest F.

Finished in 0.001222s, 1636.7965 runs/s, 1636.7965 assertions/s.

  1) Failure:
CarTest#test_bad_wheels [car_test.rb:13]:
Expected: 3
  Actual: 4

2 runs, 2 assertions, 1 failures, 0 errors, 0 skips
```

The last line gives us a quick summary, and we can see that there are now 2 assertions and 1 failure. Minitest further gives us the exact failing test, and also tells us the expected value vs the actual value. Also notice at the top, there's a "F.", which means there were 2 tests, one of which failed (that's the "F") and one of which passed (that's the ".").


# *minitest-reporters*

The default Minitest output is quite bland, but you can easily add color to the output with the minitest-reporters gem.

*$ gem install minitest-reporters*

Then, at the top of your test file, include the following lines:
```ruby
require "minitest/reporters"
Minitest::Reporters.use!
```

Now when running Minitest, the output will be colorized.

*minitest/reporters suppresses the line that shows S, F and dots that indicate what happened with the test.*


# *Skipping Tests*

Sometimes you'll want to skip certain tests. Perhaps you are in the middle of writing a test, and do not want it run yet, or for any other reason. Minitest allows for this via the skip keyword. All you have to do is put skip at the beginning of the test, and Minitest will skip it. 

*You could also pass a string into skip if you want a more custom display message.*

# *Expectation Syntax*

Thus far, we've been using the assertion or assert-style syntax. Minitest also has a completely different syntax called expectation or spec-style syntax.

In expectation style, tests are grouped into describe blocks, and individual tests are written with the it method. We no longer use assertions, and instead use expectation matchers. That sounds crazy, but when written out, it reads very nice. 
(see `car_spec.rb`)

Running that code will give us the following output.
```ruby
Run options: --seed 51670

# Running:

Car#wheels .

Finished in 0.001067s, 937.0051 runs/s, 937.0051 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

That looks the same as using assertion style! And that's the point -- using either assertion or expectation syntax is a style choice. Some people prefer the expectation syntax because it mimics `RSpec's` syntax.

# *Summary*

- Minitest is an intuitive test library. It comes installed with Ruby.
- Using Minitest is very easy, and you shouldn't be afraid to play around with it.
- Create a test file
- Create a test class by subclassing MiniTest::Test.
- Create a test by creating an instance method that starts with test_.
- Create assertions with assert_equal, and pass it the expected value and the actual value.
- Colorize Minitest output with minitest-reporters
- You can skip tests with skip.
- Minitest comes in two syntax flavors: assertion style and expectation style. The latter is to appease `RSpec` users, but the former is far more intuitive for beginning Ruby developers.
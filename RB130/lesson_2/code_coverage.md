When writing tests, we want to get an idea of code coverage, or how much of our actual program code is tested by a test suite. You can see from our `TodoList` tests that all of our public methods are covered. If we are measuring code coverage based on testing the public methods, we could say that we have achieved 100% code coverage. 
Note that even though we are only testing public code, code coverage is based on all of your code, both public and private. Also, this doesn't mean every edge case is considered, or that even our program is working correctly. It only means that we have some tests in place for every method. There are other ways to measure code coverage too besides looking at public methods.
For example, more sophisticated tools can help with ensuring that all branching logic is tested. While not foolproof, code coverage is one metric that you can use to gauge code quality.

simplecov is a code analysis tool that determines what percentage of our code has been tested.

To get started, install the simplecov gem.
$ gem install simplecov


Next, put this at the top of the test file.
```ruby
require 'simplecov'
SimpleCov.start
```

When running a file a "coverage" directory will be created in the same directory. `inder.html` will show us the code coverage.

This should inform us to add more tests so that the code coverage should get closer to 100 percent. It's not always necessary to get to 100 percent coverage, but the percentage should depend on the type of project you work on. The more fault tolerant it has to be, the higher the test coverage.

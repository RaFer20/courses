require 'minitest/autorun'

class MyFirstTest < Minitest::Test
  def test_first_test
    assert true
  end
end

# Run this file as you would any Ruby file

=begin
$ ruby temp.rb
Run options: --seed 30741

# Running:

MyFirstTest .

Finished in 0.001034s, 967.2303 runs/s, 967.2303 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
=end
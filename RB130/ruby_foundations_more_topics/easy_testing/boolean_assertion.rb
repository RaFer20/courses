# Write a minitest assertion that will fail if the value.odd? is not true.


assert_equal(true, value.odd?) 
# or
assert_equal true value.odd?

# or
assert value.odd?, 'value is not odd'
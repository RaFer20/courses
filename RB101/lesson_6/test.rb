a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end

`line 1` initializes the variable 'a' to the String Object 'Hello'
`lines 3 through 7` make up a coniditional `if/else` statement that will output "Hello is truthy" if the value of 'a'
is truthy and "Hello is falsey" if it is false or nil.

The statement would output "Hello is truthy" because "Hello" is truthy. It would return nil because `puts` was the last evaluated statement
and `puts` always returns nil

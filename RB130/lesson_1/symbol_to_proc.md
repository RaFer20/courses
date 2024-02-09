

```ruby
[1, 2, 3, 4, 5].map do |num|
  num.to_s
end

# => ["1", "2", "3", "4", "5"]
```

This type of code is so common that there's a shortcut for it. We could write the above like this:
```ruby
[1, 2, 3, 4, 5].map(&:to_s)                     # => ["1", "2", "3", "4", "5"]
```

The above code iterates through every element in the array and calls to_s on it, then saves the result into a new array. After it's done iterating, the new array is returned. And because it returns another array, you could chain another transformation.

```ruby
[1, 2, 3, 4, 5].map(&:to_s).map(&:to_i)         # => [1, 2, 3, 4, 5]
```

The code above transforms every integer into a string and then back into an integer. Note that the `&` must be followed by a `symbol name` for a method that can be invoked on each element. In the last example, we use the symbols `:to_s` and `:to_i` to represent the `#to_s` and `#to_i` methods.

If we wanted to use the `String#prepend` method to prepend each value with `"The number is:"` we wouldn't be able to do it with the shortcut; It doesn't work for methods that take arguments.

This shortcut will work with any collection method that takes a block, not only on `map`. For example:
```ruby
["hello", "world"].each(&:upcase!)              # => ["HELLO", "WORLD"]
[1, 2, 3, 4, 5].select(&:odd?)                  # => [1, 3, 5]
[1, 2, 3, 4, 5].select(&:odd?).any?(&:even?)    # => false
```

# Symbol#to_proc

This first line of code is converted into the second line of code.
```ruby
(&:to_s)
{ |n| n.to_s }
```

We're applying the & operator to an object (possibly referenced by a variable). When this happens, Ruby tries to convert the object to a `block`. That's easy if the object is a `Proc` - converting a `Proc` to a `block` is something that Ruby can do naturally. However, if the object is not already a `Proc`, we have to first convert it to a `Proc`. In that case, we call `#to_proc` on the object, which returns a `Proc`. Ruby can then convert the resulting `Proc` to a `block`. In the case of something like `&:to_s`, Ruby is being told to convert the Symbol `to_s` to a `block`. To do that, it first calls `Symbol#to_proc` to convert the `symbol` to a `Proc`, and it then converts the `Proc` to a `block`.


Here are some more examples of this mechanism at work. The first example below will do the 2 steps above in one line.
```ruby
def my_method
  yield(2)
end

# turns the symbol into a Proc, then & turns the Proc into a block
my_method(&:to_s)               # => "2"
```

The code example below will try to break up the 2 steps.

```ruby
def my_method
  yield(2)
end

a_proc = :to_s.to_proc          # explicitly call to_proc on the symbol
my_method(&a_proc)              # convert Proc into block, then pass block in. Returns "2"
```


# Summary

The main concept you have to know is that you can use a shortcut when calling methods with blocks by using the symbol-to-proc trick. But understand that there's some depth behind the syntax, and try to wrap your head around it.